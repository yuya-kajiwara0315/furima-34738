class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }

    VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    validates :last_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }

    VALID_NAMEKANA_REGEX = /\A([ァ-ン]|ー)+\z/
    validates :last_name_kana, format: { with: VALID_NAMEKANA_REGEX }
    validates :first_name_kana, format: { with: VALID_NAMEKANA_REGEX }

    validates :birth_day
  end
end
