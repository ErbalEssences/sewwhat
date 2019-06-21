class Api::TagsController < ApplicationController
  def index
    @tags = Tag.all
    render 'index.json.jbuilder'
  end

  def create
    @tag = Tag.new(
                    name: params[:name.titleize]
                  )
    if @tag.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @tag = Tag.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.name = params[:name.titleize] || @tag.name.titleize
    
    if @tag.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    render json: {message: "Successfully destroyed image"}
  end
end
