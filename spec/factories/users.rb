FactoryBot.define do

  factory :user do
    nickname              { 'yamada太郎' }
    email                 { Faker::Internet.free_email }
    password              { 'yamada00' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birth_day             { "2000-01-01" }
  end
  
end