class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.integer :account_id

      t.string  :level_name,     :default => 'world'
      t.integer :max_players,    :default => 20
      t.string  :server_ip
      t.integer :server_port,    :default => 25565
      t.boolean :online_mode,    :default => true
      t.boolean :hellworld,      :default => false
      t.boolean :spawn_monsters, :default => true
      t.boolean :spawn_animals,  :default => true
      t.boolean :pvp,            :default => true

      t.timestamps
    end

    add_index :servers, :account_id
  end

  def self.down
    remove_index :account_i, :column_name
    drop_table :servers
  end
end