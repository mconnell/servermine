class BannedPlayersServers < ActiveRecord::Migration
  def self.up
    create_table :banned_players_servers, :id => false, :force => true do |t|
      t.integer :player_id
      t.integer :server_id
    end
  end

  def self.down
    drop_table :banned_players_servers
  end
end
