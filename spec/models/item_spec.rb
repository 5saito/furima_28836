require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品出品できる時" do
      it "名前、商品説明、価格、カテゴリー、画像、配送地域、状態、配送料金、配送日数が存在すれば、出品できる" do
        expect(@item).to be_valid
      end
      it "価格は半角数字で入力する" do
        @item.price = /\A[0-9]+\z/
        expect(@item).to be_valid
      end
    end

    context "商品出品できない時" do
      it "商品名が空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品情報が空だと出品できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "カテゴリーを選択していないと出品できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "商品状態を選択していないと出品できない" do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end
      it "配送料金を選択していないと出品できない" do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      it "発送の地域を選択していないと出品できない" do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_message).to include("Prefecture Select")
      end
      it "配送までの日数の選択がないと出品できない" do
        @item.days = nil
        @item.valid?
        expect(@item.errors.full_message).to include("Scheduled delivery Select")
      end
    end
  end
end
