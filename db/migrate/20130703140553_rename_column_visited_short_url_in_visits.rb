class RenameColumnVisitedShortUrlInVisits < ActiveRecord::Migration
  def change
    rename_column :visits, :visited_short_url, :visited_short_url_id
  end
end
