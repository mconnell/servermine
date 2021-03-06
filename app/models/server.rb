class Server < ActiveRecord::Base
  # associations
  belongs_to :account
  has_one    :server_properties
  has_and_belongs_to_many :ops, :class_name => 'Player', :join_table => 'ops_servers'
  has_and_belongs_to_many :banned_players, :class_name => 'Player', :join_table => 'banned_players_servers'
  has_and_belongs_to_many :banned_ips, :class_name => 'Ip', :join_table => 'banned_ips_servers'

  accepts_nested_attributes_for :ops, :allow_destroy => true
  accepts_nested_attributes_for :banned_players, :allow_destroy => true
  accepts_nested_attributes_for :banned_ips, :allow_destroy => true

  # validations
  validates_presence_of :account

  # callbacks
  after_create :create_server_properties

  def create_ops_file
    file_path = Rails.root.join('tmp', "opts-#{Time.now.to_f}")
    File.open(file_path, 'w') do |file|
      ops.each do |player|
        file.write "#{player.username}\r\n"
      end
    end
    file_path
  end

  def create_banned_players_file
    file_path = Rails.root.join('tmp', "banned_players-#{Time.now.to_f}")
    File.open(file_path, 'w') do |file|
      banned_players.each do |player|
        file.write "#{player.username}\r\n"
      end
    end
    file_path
  end

  def create_banned_ips_file
    file_path = Rails.root.join('tmp', "banned_ips-#{Time.now.to_f}")
    File.open(file_path, 'w') do |file|
      banned_ips.each do |player|
        file.write "#{player.address}\r\n"
      end
    end
    file_path
  end
end
