class AddRssurlToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :rss_url, :string
  end
end
