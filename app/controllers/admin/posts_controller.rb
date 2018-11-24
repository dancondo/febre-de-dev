class Admin::PostsController < ApplicationController
  before_action :check_admin
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def check_admin
    return user_signed_in? && current_user.admin?
    redirect_to root_path
  end
end
