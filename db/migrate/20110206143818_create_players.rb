class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :username

      t.timestamps
    end

    add_index :players, :username
  end

  def self.down
    remove_index :players, :username
    drop_table :players
  end
end