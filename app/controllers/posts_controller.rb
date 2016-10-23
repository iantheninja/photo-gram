class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      flash[:success] = "Successfully created post"
      redirect_to posts_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  private
  def permit_post
    params.require(:post).permit(:image, :descrition)

  end
end
