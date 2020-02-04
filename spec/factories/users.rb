FactoryBot.define do
  factory :user do
    id { 1 }
    name { "user" }
    account_id { "id" }
    password { "password" }
    api_token { "token" }
  end
end
