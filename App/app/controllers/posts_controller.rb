class PostsController < ApplicationController
  def index
    @posts = Post.all

  end

  def new
    @post = Post.new(author: session[:author])
  end

  def edit
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
    
  end

  def destroy
    
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body, :published)
  end
end
