class ItemsController < ApplicationController
  before_action :authenticate_user!

  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    # @item.valid?を使って条件分岐をする。成功したときはsaveそうでないときはnewにレンダーする
    # モデルの extendassosiationの記述
    if @item.valid?
       @item.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def items_params
    params.require(:item).permit(:text, :name, :image, :price, :category, 
    :prefecture, :condition, :days, :delivery_fee, :user).merge(user_id: current_user.id)
  end
end
