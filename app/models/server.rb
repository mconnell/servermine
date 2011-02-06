class Server < ActiveRecord::Base
  # associations
  belongs_to :account
  has_one    :server_properties
  has_and_belongs_to_many :ops, :class_name => 'Player', :join_table => 'ops_servers'

  # validations
  validates_presence_of :account

  # callbacks
  after_create :create_server_properties
end
