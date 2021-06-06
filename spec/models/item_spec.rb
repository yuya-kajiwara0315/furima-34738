require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品が出品できるとき' do

      it "name, description, category_id, condition_id, charge_id, prefecture_id,delivery_id, selling_price, user_idが存在すれば登録できる" do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.build(:item, user_id: @user.id)
        expect(@item).to be_valid
      end

      it 'nameが４０文字以下なら登録できる' do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.name = "1234567890123456789012345678901234567890"
        expect(@item).to be_valid
      end

      it 'descriptionが１０００文字以下なら登録できる' do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.description = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
        expect(@item).to be_valid
      end


 
    end



    context '商品が出品できないとき' do

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが４１文字以上なら登録できない' do
        @item.name = "123456789012345678901234567890123456789041"
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが１００１文字以上なら登録できない' do
        @item.description = "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end

      it 'category_idが１では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが１では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'charge_idが１では登録できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end

      it 'prefecture_idが１では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'delivery_idが１では登録できない' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end

      it 'selling_priceが２９９以下では登録できない' do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end

      it 'selling_priceが１０００００００以上では登録できない' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 9999999")
      end

      it 'user_idが空では登録できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end

  end
end