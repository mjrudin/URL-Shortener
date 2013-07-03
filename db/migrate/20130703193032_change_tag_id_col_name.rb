class ChangeTagIdColName < ActiveRecord::Migration
  def change
	rename_column :tags, :tag_id, :tag_topic_id
  end
end
