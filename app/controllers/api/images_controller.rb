class Api::ImagesController < ApplicationController

  def index
    @images = Image.all
    render 'index.json.jbuilder'
  end

  def create
    @image = Image.new(
                            pattern_id: params[:pattern_id],
                            user_id: current_user.id,
                            url: params[:url],
                            line_art: params[:line_art.titleize]
                          )
    if @image.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    if current_user.id == @closet.user_id || current_user.admin?

      @image = Image.find(params[:id])
      @image.pattern_id = params[:pattern_id] || @image.pattern_id
      @image.url = params[:url] || @image.url
      @image.line_art = params[:line_art] || @image.line_art
      
      if @image.save
        render 'show.json.jbuilder'
      else 
        render json: {message: @image.errors.full_messages }, status: :unprocessable_entity
      end
    else 
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user.id == @closet.user_id || current_user.admin?
      @image = Image.find(params[:id])
      @image.destroy
      render json: {message: "Successfully destroyed image"}
    else 
      render json: {}, status: :unauthorized
    end
  end
end
