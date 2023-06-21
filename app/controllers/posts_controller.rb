
class PostsController < ApplicationController
  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end