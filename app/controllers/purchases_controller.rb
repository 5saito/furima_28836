class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    
    @purchase = ItemPurchase.new
  end

  def new
    @purchase = ItemPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new(purchase_params)
    if  @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:post_cord, :prefecture_id, :city, :address, :room_number, :phone_number,:token
    ).merge(user_id:current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
