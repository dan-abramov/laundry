class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @posts = pagy(Post.all, items: 2)
  end

  def show
    @post = Post.find(params[:id])
  end
end
