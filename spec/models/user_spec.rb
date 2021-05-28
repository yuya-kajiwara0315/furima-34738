require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "同じemailがあると登録できない" do
    end
    it "emailに@が含まれていないと登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードが６文字以上でないと登録できない" do
    end
    it "パスワード（確認）が空では登録できない" do
    end
    it "パスワードとパスワード（確認）が一致していないと登録できない" do
    end
    it "お名前（全角）が空だと登録できない" do
    end
    it "お名前カナ（全角）が空では登録できない" do
    end
    it "生年月日が空だと登録できない" do
    end
  end
end