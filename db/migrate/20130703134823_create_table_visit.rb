class CreateTableVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :visited_short_url

      t.timestamps
    end
  end
end
