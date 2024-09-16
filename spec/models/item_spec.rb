require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '出品したuser,item_name,explanation,category_id,
          situation_id,shipping_fee_id,prefecture_id,
          shipping_date_id,amount,image,が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'situation_idが空では登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it 'amountが空では登録できない' do
        @item.amount = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount can't be blank")
      end

      it 'userが存在しなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'amountが300より小さいと登録できない' do
        @item.amount = 4
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount must be greater than 299')
      end

      it 'amountが9999999より大きいと登録できない' do
        @item.amount = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount must be less than 10000000')
      end

      it 'amountがintegerでないと登録できない' do
        @item.amount = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount is not a number')
      end
    end
  end
end
