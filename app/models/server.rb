class Server < ActiveRecord::Base
  # associations
  belongs_to :account
  has_one    :server_properties

  # validations
  validates_presence_of :account

  # callbacks
  after_create :create_server_properties
end
