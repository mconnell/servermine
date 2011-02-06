class Player < ActiveRecord::Base

  # validations
  validates_uniqueness_of :username, :case_sensitive => false

end
