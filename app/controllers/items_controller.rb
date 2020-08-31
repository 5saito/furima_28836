class ItemsController < ApplicationController
  before_action :authenticate_user!

  
  def new
    @item = Item.new
  end
  private

  def items_params
    params.require(:item).permit(:text, :name, :image, :price, :category, 
    :prefecture, :condition, :days, :delivery_fee, :user).merge(user_id: current_user.id)
  end
end
