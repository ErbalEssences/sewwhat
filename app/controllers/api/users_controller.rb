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
    if current_user.id == @closet.user_id || current_user.admin?
      @user = User.find(params[:id])
      @user.username = params[:username] || @user.username
      @user.email = params[:email] || @user.email
      @user.skill = params[:skill] || @user.skill
      @user.avatar_url = params[:avatar_url] || @user.avatar_url
      @user.password = params[:password] || @user.password
      @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
      
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
    if current_user.id == @closet.user_id || current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
      render json: {message: "Successfully destroyed user"}
    else
      render json: []
    end
  end
end
