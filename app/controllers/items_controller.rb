class ItemsController < ApplicationController
  
  skip_before_action  :authenticate_user!, only: [:index, :show]
  
  def index
    @item = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)

    if @item.valid?
       @item.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

    def show
      @item = Item.find(params[:id])
    end


  private
  def items_params
    params.require(:item).permit(:text, :name, :image, :price, :category, 
    :prefecture, :condition, :days, :delivery_fee, :user).merge(user_id: current_user.id)
  end
end


