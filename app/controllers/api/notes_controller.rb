class Api::NotesController < ApplicationController
    def index
    @notes = Note.all
    render 'index.json.jbuilder'
  end

  def create
    @note = Note.new(
                    pattern_id: params[:pattern_id],
                    user_id: params[:user_id],
                    body: params[:body],
                    public: params[:public]
                  )
    if @note.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @note = Note.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @note = Note.find(params[:id])
    @note.pattern_id = params[pattern_id] || @note.pattern_id
    @note.user_id = params[user_id] || @note.user_id
    @note.body = params[body] || @note.body
    @note.public = params[public] || @note.public
    
    if @note.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @note.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: {message: "Successfully destroyed image"}
  end
  # user_id: current_user.id
end
