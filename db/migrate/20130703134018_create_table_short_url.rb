class CreateTableShortUrl < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :url
      t.integer :long_url_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
