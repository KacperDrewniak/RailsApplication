class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
