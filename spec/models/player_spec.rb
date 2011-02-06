require 'spec_helper'

describe Player do
  describe "validations" do
    it "should require a username is unique" do
      Player.create! :username => 'servermine'
      player = Player.new :username => 'ServerMine'

      assert !player.valid?
      assert player.errors[:username].present?
    end
  end
end
