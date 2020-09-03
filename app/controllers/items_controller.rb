class ItemsController < ApplicationController
<<<<<<< Updated upstream
  
  skip_before_action  :authenticate_user!, only: [:index]
=======
  before_action :authenticate_user!
  # before_action :move_to_index, except: [:index, :show, :search]
>>>>>>> Stashed changes
  
  def index
    @item = Item.all.order("created_at DESC")
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

  private
  def items_params
    params.require(:item).permit(:text, :name, :image, :price, :category, 
    :prefecture, :condition, :days, :delivery_fee, :user).merge(user_id: current_user.id)
  end
end


