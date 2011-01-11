class Server < ActiveRecord::Base
  # associations
  belongs_to :account

  # validations
  validates_presence_of :account
end
