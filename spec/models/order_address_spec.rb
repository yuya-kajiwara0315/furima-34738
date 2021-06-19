require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先入力' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end


    context '内容に問題ない場合' do

      it 'すべての値が正しく入力されていれば保存できること' do
        binding.pry
        expect(@order_address).to be_valid
      end
    end


    context '内容に問題がある場合' do

      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'prefecture_idが１だと保存できないこと' do
      end

      # it 'cityが空だと保存できないこと' do
      # end

      # it 'house_numberが空だと保存できないこと' do
      # end

      # it 'phone_numberが空だと保存できないこと' do
      # end
    end

  end
end
