class Api::PatternsController < ApplicationController
  def index
    @patterns = Pattern.all
    render 'index.json.jbuilder'
  end

  def create
    @pattern = Pattern.new(
                            name: params[:name],
                            url: params[:url],
                            price: params[:price],
                            out_of_print: params[:out_of_print],
                            display_name: params[:display_name.titleize]
                          )
    if @pattern.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @pattern.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @pattern = Pattern.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @pattern = Pattern.find(params[:id])
    @pattern.name = params[:name] || @pattern.name
    @pattern.url = params[:url] || @pattern.url
    @pattern.price = params[:price] || @pattern.price
    @pattern.out_of_print = params[:out_of_print] || @pattern.out_of_print
    @pattern.display_name = params[:display_name.titleize] || @pattern.display_name
    
    if @pattern.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @pattern.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @pattern = Pattern.find(params[:id])
    @pattern.destroy
    render json: {message: "Successfully destroyed pattern"}
  end
end
