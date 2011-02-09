require 'spec_helper'

describe Ip do
  describe "validations" do
    it "should require the presence of an address" do
      ip = Ip.new :address => nil
      assert !ip.valid?
      assert ip.errors[:address].present?
    end
  end
end
