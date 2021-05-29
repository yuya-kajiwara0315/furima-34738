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

# FactoryBot.define do
#   factory :user do
#     nickname              {"toda"}
#     email                 {"totodada@gmail.com"}
#     password              {"12345678"}
#     password_confirmation {"12345678"}
#   end
# end



# nickname              {Faker::Name.name}
# email                 {Faker::Internet.free_email}
# password              {Faker::Internet.password(min_length: 6)}
# password_confirmation {password}
# first_name            {person.first.kanji}
# last_name             {person.last.kanji}
# first_name_kana       {person.first.katakana}
# last_name_kana        {person.last.katakana}
# birth_day             {}