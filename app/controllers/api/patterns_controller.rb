class Api::PatternsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  
  def index
    # @patterns = Pattern.all
    @patterns = Pattern.all.includes(:images, :notes, :closet_patterns, :closets)

    name_search = params[:name]
    display_name_search = params[:display_name]
    tag_name_search = params[:tags]
    out_of_print_search = params[:out_of_print]
    top_50_search = params[:top_50]
    price_search_low = params[:price_low]
    price_search_high = params[:price_high]
    sorted_price = params[:sort_price]
    sorted_name = params[:sort_name]
    offset_number = params[:offset]
    page_number = params[:page]

    if sorted_price
      if sorted_price == "desc"
        @patterns = @patterns.all.order(price: :desc)
      elsif sorted_price  == "asc"
        @patterns = @patterns.all.order(price: :asc)
      end
    elsif sorted_name
      if sorted_name == "desc"
        @patterns = @patterns.all.order(name: :desc)
      elsif sorted_name  == "asc"
        @patterns = @patterns.all.order(name: :asc)
      end
    else
      @patterns = @patterns.all.order(name: :asc)
    end

    if price_search_low || price_search_high
      @patterns = @patterns.where("price > ? AND price < ?", price_search_low.to_i, price_search_high.to_i)
    end

    if name_search
      @patterns = @patterns.where("name iLIKE ?","%#{name_search.strip}%")
    end

    if display_name_search
      @patterns = @patterns.where("display_name iLIKE ?","%#{display_name_search.strip}%")
    end

    if out_of_print_search
      @patterns = @patterns.where("out_of_print = true") if out_of_print_search == "true"
      @patterns = @patterns.where("out_of_print = false") if out_of_print_search == "false"
      @count = @patterns.count()
    end

    if top_50_search
      @patterns = @patterns.order(created_at: :desc)
      @patterns.limit(10)
      # @patterns = @patterns.where("")
    end

    

    if tag_name_search
      pattern_collections = Tag.where(name: tag_name_search).map { |tag| tag.patterns }
      base_array = nil
      pattern_collections.each do |collection|
        base_array ||= collection 
        base_array &= collection
      end
      @patterns = base_array

    end
    @count = @patterns.count()
    number = @count/30



    offset_number = 0 unless offset_number
    page_number = 1 unless page_number
    offset_number = offset_number.to_i
    page_number = page_number.to_i
    @numbers = []
    number.times do |index|
      if (index + 1) == 1
        @numbers << (index + 1)
      elsif (index + 1) >= (page_number - 3) && (index + 1) <= (page_number + 3)
        @numbers << (index + 1)
      else 
        @numbers << "..."
      end
    end
    @numbers = @numbers.uniq
    unless @numbers.include? number 
      if @numbers.include? (number - 1)
        @numbers << number
      elsif @numbers[-1] == "..."
        @numbers << number
      else
        @numbers << "..."
        @numbers << number
      end
    end

    @patterns = @patterns.limit(30).offset(offset_number)
    render 'index.json.jbuilder'
  end


  def create
    @pattern = Pattern.new(
                            name: params[:name],
                            url: params[:url],
                            file: params[:file],
                            price: params[:price],
                            out_of_print: params[:out_of_print],
                            display_name: (params[:display_name]).titleize,
                            description: params[:description],
                            online_only: params[:online_only]
                          )
    if @pattern.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @pattern.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @pattern = Pattern.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @pattern = Pattern.find(params[:id])
    @pattern.name = params[:name] || @pattern.name
    @pattern.url = params[:url] || @pattern.url
    @pattern.price = params[:price] || @pattern.price
    @pattern.out_of_print = params[:out_of_print] || @pattern.out_of_print
    @pattern.display_name = (params[:display_name] || @pattern.display_name).titleize
    @pattern.description = params[:description] || @pattern.description
    @pattern.out_of_print = params[:online_only] || @pattern.online_only

    
    if @pattern.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @pattern.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @pattern = Pattern.find(params[:id])
    @pattern.destroy
    render json: {message: "Successfully destroyed pattern"}
  end
end
