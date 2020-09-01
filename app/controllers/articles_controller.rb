class ArticlesController < ApplicationController
  def index
  end

  def new
    @articles = User.new
  end
  def create
    @articles = User.create(articles_params)
  end

  private

  def articles_params
    params.require(:user).permit(:name, :text, :price, :category, :image,
     :prefecture, :condition, :user, :days, :delivery_fee)
  end
end
