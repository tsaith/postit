class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post was updated."
      redirect_to posts_path
    else
      render 'show'
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Your post was deleted."
      redirect_to posts_path
    else
      render 'index'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description,
      category_ids: [])
  end  

end
