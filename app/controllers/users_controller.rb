class UsersController < ApplicationController
  def index
    @users = User.all
    redirect_to :action => 'new'
  end

  def create
    @user = User.all
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  
end
