class Api::NotesController < ApplicationController
  def index
    @notes = Note.all
    @notes = (current_user.notes + @notes.where(public: true)).uniq
    render 'index.json.jbuilder'
  end

  def create
    @note = Note.new(
                    pattern_id: params[:pattern_id],
                    user_id: current_user.id,
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
    if @note.public == true || current_user
      render 'show.json.jbuilder'
    else
      render json: []
    end
  end

  def update
    if current_user.id == @closet.user_id || current_user.admin?
      @note = Note.find(params[:id])
      @note.pattern_id = params[pattern_id] || @note.pattern_id
      @note.body = params[body] || @note.body
      @note.public = params[public] || @note.public
      
      if @note.save
        render 'show.json.jbuilder'
      else 
        render json: {message: @note.errors.full_messages }, status: :unprocessable_entity
      end
    else 
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user.id == @closet.user_id || current_user.admin?
      @note = Note.find(params[:id])
      @note.destroy
      render json: {message: "Successfully destroyed note"}
    else 
      render json: {}, status: :unauthorized
    end
  end
  
end
