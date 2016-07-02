class CreateJoinTablePlaylistLink < ActiveRecord::Migration
  def change
    create_join_table :playlists, :links do |t|
      # t.index [:playlist_id, :link_id]
      # t.index [:link_id, :playlist_id]
    end
  end
end
