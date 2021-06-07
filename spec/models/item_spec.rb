require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品が出品できるとき' do

      it "image,name, description, category_id, condition_id, charge_id, prefecture_id,delivery_id, selling_price, user_idが存在すれば登録できる" do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
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
        @item.description = "123456789012345678912345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
        expect(@item).to be_valid
      end

      it "category_idが１以外なら登録できる" do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it "condition_idが１以外なら登録できる" do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.condition_id = 2
        expect(@item).to be_valid
      end

      it "charge_idが１以外なら登録できる" do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.charge_id = 2
        expect(@item).to be_valid
      end

      it "prefecture_idが１以外なら登録できる" do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end

      it "delivery_idが１以外なら登録できる" do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.charge_id = 2
        expect(@item).to be_valid
      end

      it 'selling_priceが３００以上なら登録できる' do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.selling_price = 300
        expect(@item).to be_valid
      end

      it 'selling_priceが９９９９９９９以下なら登録できる' do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.selling_price = 9_999_999
        expect(@item).to be_valid
      end

      it 'selling_priceが半角数字なら登録できる' do
        @user = create(:user)
        @item = build(:item, user_id: @user.id)
        @item.selling_price = 300
        expect(@item).to be_valid
      end

 
    end



    context '商品が出品できないとき' do

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

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
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが１では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'charge_idが１では登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end

      it 'prefecture_idが１では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'delivery_idが１では登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end

      it 'selling_priceが２９９以下では登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end

      it 'selling_priceが１０００００００以上では登録できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end

      it '販売価格が英字のみだと登録できない' do
        @item.selling_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end

      it '販売価格が半角英数字混合だと登録できない' do
        @item.selling_price = 'aaa333'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end

      it '販売価格が全角数字だと登録できない' do
        @item.selling_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end

      it 'user_idが空では登録できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end

  end
end