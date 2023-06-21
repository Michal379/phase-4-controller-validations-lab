class AuthorsController < ApplicationController
  
  def index
    authors = Author.all
    render json: authors
  end

  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.new(author_params)
    if author.save
      render json: author, status: :created
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.permit(:name, :email)
  end
end