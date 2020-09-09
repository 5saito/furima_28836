class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase = ItemsPurchase.new
  end

  def create
    @purchase = ItemsPurchase.new(purchase_params)
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
    params.require(:items_purchase).permit(:name, :text, :price, :image, :post_cord, :prefecture, :city, :address, :room_number, :phone_number, :item_purchase,:token
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
