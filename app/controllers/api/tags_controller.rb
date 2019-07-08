class Api::TagsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  
  def index
    tag_search = params[:category]
    @tags = Tag.all.order(category: :asc)
    if tag_search
      @tags = @tags.where("category = ?","%#{tag_search}%")
    end
    render 'index.json.jbuilder'
  end

  def index_by_category
    @tags = Tag.all
    render 'by_category.json.jbuilder'
  end

  def create
    @tag = Tag.new(
                    name: (params[:name]).titleize
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
    @tag.name = (params[:name] || @tag.name)
    @tag.category = (params[:category] || @tag.category).titleize
    
    if @tag.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    render json: {message: "Successfully destroyed tag"}
  end
end
