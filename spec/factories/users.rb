FactoryBot.define do
  factory :user do
    name { "user" }
    account_id { "id" }
    password { "password" }
    api_token { "token" }
  end
end
