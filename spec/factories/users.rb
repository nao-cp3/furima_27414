FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    firstname             {"kkk"}
    firstname_kana        {"カタカナ"}
    lastname              {"kkk"}
    lastname_kana         {"カタカナ"}
    birthdate             {"20200101"}
  end
end