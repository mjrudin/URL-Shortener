class ChangeColNameInShortUrl < ActiveRecord::Migration
  def change
	rename_column :short_urls, :creator_id, :user_id
  end
end
