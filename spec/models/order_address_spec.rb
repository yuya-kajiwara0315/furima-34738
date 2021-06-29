require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先入力' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end


    context '内容に問題ない場合' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end


    context '内容に問題がある場合' do

      it 'addressが空だと保存できないこと' do 
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'addressが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.address = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが１だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'cityが全角文字以外だと保存できないこと' do
        @order_address.city = 'tokyo'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City 全角文字を使用してください")
      end

      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが数字以外だと保存できないこと' do
        @order_address.phone_number = '電話番号'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが9桁以下では登録できないこと' do
        @order_address.phone_number = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上では登録できないこと' do
        @order_address.phone_number = '1234567890123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが英数混合では登録できないこと' do
        @order_address.phone_number = '123456789ab'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空では登録できないこと' do 
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do 
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do 
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

    end

  end
end
