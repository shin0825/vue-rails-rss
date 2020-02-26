class AddTweetUrlToLinks < ActiveRecord::Migration[6.0]
  def up
    add_column :links, :tweet_url, :string
  end

  def down
    remove_column :links, :tweet_url, :string
  end
end
