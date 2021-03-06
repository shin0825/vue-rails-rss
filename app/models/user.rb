class User < ApplicationRecord
  has_many :links, dependent: :destroy

  has_secure_password
  has_secure_token :api_token

  validates :account_id, presence: true, uniqueness: true
end
