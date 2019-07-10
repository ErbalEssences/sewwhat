class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def create
    @user = User.new(
                      username: params[:username],
                      email: params[:email],
                      skill: params[:skill],
                      avatar_url: params[:avatar_url],
                      avatar: params[:avatar],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation]
                    )
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user = User.find(params[:id])
    if current_user.id == @user.id || current_user.admin?
      p params[:avatar]
      @user.username = params[:username] || @user.username
      @user.email = params[:email] || @user.email
      @user.skill = params[:skill] || @user.skill
      # @user.avatar_url = params[:avatar_url] || @user.avatar_url
      unless params[:avatar] == ""
        @user.avatar = params[:avatar] || @user.avatar 
      end
      if @user.save
        render 'show.json.jbuilder'
      else 
        render json: {message: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: []
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.id == @user.id || current_user.admin?
      @user.destroy
      render json: {message: "Successfully destroyed user"}
    else
      render json: []
    end
  end
end
