require 'rails_helper'

RSpec.describe ItemsPurchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  before do
    @items_purchase = FactoryBot.build(:items_purchase)
  end

  describe "商品購入機能" do
    context "商品購入できる時" do
      it "カード情報、郵便番号、都道府県、市区町村、番地、電話番号が存在すれば購入できる" do
        expect(@items_purchase).to be_valid
      end
      it "郵便番号はハイフンを含む７桁" do
        @items_purchase.post_cord = /\A\d{3}[-]\d{4}\z/
        expect(@items_purchase).to be_valid 
      end
      it "電話番号はハイフンなしでの１１桁" do
        @items_purchase.phone_number = /\A\d{11}\z/
        expect(@items_purchase).to be_valid 
      end
    end

    context "商品購入できない時" do
      it "カード情報が空だと購入できない" do
        @items_purchase.token = nil
        @items_purchase.valid?
        expect(@items_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号がないと購入できない" do
        @items_purchase.post_cord = nil
        @items_purchase.valid?
        expect(@items_purchase.errors.full_messages).to include("Postal Code can't be blank")
      end
      it "郵便番号にハイフンがなく、６桁以下だと購入できない" do
        @items_purchase.post_cord = /\A\d{6}\z/
        @items_purchase.valid?
        expect(@items_purchase.errors.full_messages).to include("Postal Code Input correctly")
      end
      it "都道府県を選択していないと購入できない" do
        @items_purchase.prefecture = nil
        @items_purchase.valid?
        expect(@items_purchase.errors.full_messages).to include("Prefecture Select")
      end
      it "市区町村が空だと購入できない" do
        @items_purchase.city = nil
        @items_purchase.valid?
        expect(@items_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと購入できない" do
        @items_purchase.address = nil
        @items_purchase.valid?
        expect(@items_purchase.errors.full_messages).to include("Addresses can't be blank")
      end
      it "電話番号が空だと購入できない" do
        @items_purchase.phone_number = nil
        @items_purchase.valid?
        expect(@items_purchase.errors.full_message).to include("Phone number can't be blank")
      end
    end
  end
end
