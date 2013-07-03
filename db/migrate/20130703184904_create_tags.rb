class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :tag_id
      t.integer :short_url_id

      t.timestamps
    end
  end
end
