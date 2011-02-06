class CreateOpsServersTable < ActiveRecord::Migration
  def self.up
    create_table :ops_servers, :id => false, :force => true do |t|
      t.integer :player_id
      t.integer :server_id
    end
  end

  def self.down
    drop_table :ops_servers
  end
end