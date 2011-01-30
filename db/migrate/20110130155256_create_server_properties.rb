class CreateServerProperties < ActiveRecord::Migration
  def self.up
    create_table :server_properties do |t|
      t.integer  :server_id

      t.string   :level_name,     :default => "world"
      t.integer  :max_players,    :default => 20
      t.string   :server_ip
      t.integer  :server_port,    :default => 25565
      t.boolean  :online_mode,    :default => true
      t.boolean  :hellworld,      :default => false
      t.boolean  :spawn_monsters, :default => true
      t.boolean  :spawn_animals,  :default => true
      t.boolean  :pvp,            :default => true
      t.timestamps
    end

    change_table :servers do |t|
      t.remove  :level_name
      t.remove  :max_players
      t.remove  :server_ip
      t.remove  :server_port
      t.remove  :online_mode
      t.remove  :hellworld
      t.remove  :spawn_monsters
      t.remove  :spawn_animals
      t.remove  :pvp
    end
  end

  def self.down
    change_table :servers do |t|
      t.string   :level_name,     :default => "world"
      t.integer  :max_players,    :default => 20
      t.string   :server_ip
      t.integer  :server_port,    :default => 25565
      t.boolean  :online_mode,    :default => true
      t.boolean  :hellworld,      :default => false
      t.boolean  :spawn_monsters, :default => true
      t.boolean  :spawn_animals,  :default => true
      t.boolean  :pvp,            :default => true
    end

    drop_table :server_properties
  end
end
