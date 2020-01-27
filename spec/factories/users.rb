FactoryBot.define do
  factory :user do
    name { "user" }
    account_id { "id" }
    password_digest { "password" }
    api_token { "token" }
  end
end
