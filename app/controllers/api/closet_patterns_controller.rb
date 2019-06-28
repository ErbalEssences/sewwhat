class Api::ClosetPatternsController < ApplicationController

def index
    # @closet_patterns = ClosetPattern.all
    @closet_patterns = current_user.closet_patterns#.uniq
    render 'index.json.jbuilder'
  end

  def create
    @closet_pattern = ClosetPattern.new(
                            pattern_id: params[:pattern_id],
                            closet_id: params[:closet_id]
                          )
    if @closet_pattern.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @closet_pattern.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @closet_pattern = ClosetPattern.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @closet_pattern = ClosetPattern.find(params[:id])
    if current_user.id == @closet_pattern.closet.user_id || current_user.admin?
      @closet_pattern.name = params[:name] || @closet_pattern.name
      
      if @closet_pattern.save
        render 'show.json.jbuilder'
      else 
        render json: {message: @closet_pattern.errors.full_messages }, status: :unprocessable_entity
      end
    else 
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    @closet_pattern = ClosetPattern.find(params[:id])
    if current_user.id == @closet_pattern.closet.user_id || current_user.admin?
      @closet_pattern.destroy
      render json: {message: "Successfully destroyed closet"}
    else 
      render json: {}, status: :unauthorized
    end
  end


end
