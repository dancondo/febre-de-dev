class Admin::PostsController < ApplicationController
  before_action :check_admin
  before_action :set_post, only: %i[edit update destroy]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save 
      redirect_to post_path(@post)
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit 
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end

  private

  def check_admin
    return if user_signed_in? && current_user.admin
    redirect_to root_path
  end

  def set_post 
    @post = Post.find(params[:id])
  end 

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
