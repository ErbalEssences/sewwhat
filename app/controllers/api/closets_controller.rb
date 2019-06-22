class Api::ClosetsController < ApplicationController

  def index
    name_search = params[:name]
    @closets = current_user.closets
    # @closets = Closet.all
    if name_search
      @closets = @closets.where("name iLIKE ?","%#{name_search}%")
    end
    render 'index.json.jbuilder'
  end

  def create
    @closet = Closet.new(
                            name: params[:name],
                            user_id: current_user.id
                          )
    if @closet.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @closet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    name_search = params[:name]
    display_name_search = params[:display_name]
    tag_name_search = params[:tags]
    out_of_print_search = params[:out_of_print]
    @closet = Closet.find(params[:id])
    @patterns = @closet.patterns

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

    if tag_name_search
      pattern_collections = Tag.where(name: tag_name_search).map { |tag| tag.patterns }
      base_array = nil
      pattern_collections.each do |collection|
        base_array ||= collection 
        base_array &= collection
      end
      @patterns = base_array
    end
    render 'show.json.jbuilder'
  end

  def update
    @closet = Closet.find(params[:id])
    if current_user.id == @closet.user_id || current_user.admin?
      @closet.name = params[:name] || @closet.name
      
      if @closet.save
        render 'show.json.jbuilder'
      else 
        render json: {message: @closet.errors.full_messages }, status: :unprocessable_entity
      end
    else 
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    @closet = Closet.find(params[:id])
    if current_user.id == @closet.user_id || current_user.admin?
      @closet.destroy
      render json: {message: "Successfully destroyed closet"}
    else 
      render json: {}, status: :unauthorized
    end
  end
end
