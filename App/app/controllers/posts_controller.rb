class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all

  end

  def new
    @post = Post.new(author: session[:author])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    
  end

  def create
    @post = Post.new(post_params)
    @post.save
    session[:author] = @post.author
    flash[:notice] = "post dodany pomyślnie"
    redirect_to posts_path  
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    flash[:notice] = "Post zaktualizowany pomyślnie"
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "usunięto wpis"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body, :published)
  end
end
