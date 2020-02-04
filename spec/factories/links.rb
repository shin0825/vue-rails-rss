FactoryBot.define do
  factory :link do
    title { "Google" }
    url { "http://www.google.co.jp" }
    user_id { 1 }
  end
end
