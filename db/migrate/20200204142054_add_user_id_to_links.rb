class AddUserIdToLinks < ActiveRecord::Migration[6.0]
  def change
    add_reference :links, :user, foreign_key: true, :default => 1
    add_index :links, [:user_id, :created_at]
  end
end
