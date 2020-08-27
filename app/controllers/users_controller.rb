class UsersController < ApplicationController
  def index
    @users = User.all
    redirect_to :action => 'new'
  end

  def new
  end

end
