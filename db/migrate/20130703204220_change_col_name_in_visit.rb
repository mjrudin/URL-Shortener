class ChangeColNameInVisit < ActiveRecord::Migration
  def change
	rename_column :visits, :visited_short_url_id, :short_url_id
  end
end
