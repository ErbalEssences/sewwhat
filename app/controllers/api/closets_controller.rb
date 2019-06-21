class Api::ClosetsController < ApplicationController
  def index
    @closets = Closet.all
    render 'index.json.jbuilder'
  end

  def create
    @closet = Closet.new(
                            name: params[:name],
                            user_id: params[:user_id]
                          )
    if @closet.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @closet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @closet = Closet.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @closet = Closet.find(params[:id])
    @closet.name = params[:name] || @closet.name
    @closet.user_id = params[:user_id] || @closet.user_id
    
    if @closet.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @closet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @closet = Closet.find(params[:id])
    @closet.destroy
    render json: {message: "Successfully destroyed image"}
  end
end
