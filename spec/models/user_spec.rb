require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "同じemailがあると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "emailに@が含まれていないと登録できない" do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字だけでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
 

      it 'passwordが半角数字だけでは登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "お名前（全角）が空だと登録できない" do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "お名前カナ（全角）が空では登録できない" do
        @user.last_name_kana = ''
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '苗字が漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it '氏名が漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'huga'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it '苗字カナが全角カタカナ以外では登録できないこと' do
        @user.last_name_kana = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it '苗字カナが全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = 'huga'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      

      it "生年月日が空だと登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end