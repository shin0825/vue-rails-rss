FactoryBot.define do
  factory :user do
    id { 1 }
    name { "user" }
    account_id { "id" }
    password { "password" }
    api_token { "token" }
  end

  factory :other_user, class: User do
    id { 2 }
    name { "other_user" }
    account_id { "other_id" }
    password { "password" }
    api_token { "token" }
  end
end
