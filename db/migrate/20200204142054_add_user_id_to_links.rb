class AddUserIdToLinks < ActiveRecord::Migration[6.0]
  def change
    add_reference :links, :user, foreign_key: true
    add_index :links, [:user_id, :created_at], :default => 1
  end
end
