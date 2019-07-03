class Api::PatternsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  
  def index
    # @patterns = Pattern.all
    @patterns = Pattern.all.includes(:images, :notes, :closet_patterns, :closets).limit(10)

    name_search = params[:name]
    display_name_search = params[:display_name]
    tag_name_search = params[:tags]
    out_of_print_search = params[:out_of_print]
    top_50_search = params[:top_50]
      
    if name_search
      @patterns = @patterns.where("name iLIKE ?","%#{name_search}%")
    end

    if display_name_search
      @patterns = @patterns.where("display_name iLIKE ?","%#{display_name_search}%")
    end

    if out_of_print_search
      @patterns = @patterns.where("out_of_print = true") if out_of_print_search == "true"
      @patterns = @patterns.where("out_of_print = false") if out_of_print_search == "false"
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
