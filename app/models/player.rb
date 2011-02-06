class Player < ActiveRecord::Base

  # validations
  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false

end
