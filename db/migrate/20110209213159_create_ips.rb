class CreateIps < ActiveRecord::Migration
  def self.up
    create_table :ips do |t|
      t.string :address
      t.timestamps
    end

    create_table :banned_ips_servers, :id => false do |t|
      t.integer :ip_id
      t.integer :server_id
    end
  end

  def self.down
    drop_table :banned_ips_servers
    drop_table :ips
  end
end