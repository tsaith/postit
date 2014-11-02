class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    #binding.pry
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was created!"
      redirect_to posts_path
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated!"
      redirect_to posts_path
    else
      render 'show'
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post was deleted!"
      redirect_to posts_path
    else
      render 'show'
    end

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit!
  end  

end
