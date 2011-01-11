require 'spec_helper'

describe Server do
  describe "validations" do
    it "should require the presence of an account" do
      testee = Server.new(:account => nil)
      assert !testee.valid?
      assert testee.errors[:account].present?
    end
  end
end
