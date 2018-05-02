class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @post = Post.all
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
      flash[:success] = "Post created!"
    else
      flash.now[:alert] = "Post was not created, please check the form."
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash.now[:success] = "Post updated."
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Update failed, please check the form."
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to root_path
    flash[:success] = "Post deleted."
  end
  
  private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:image, :caption, :user_id)
    end
end