require 'spec_helper'

describe Server do
  describe "validations" do
    it "should require the presence of an account" do
      testee = Server.new(:account => nil)
      assert !testee.valid?
      assert testee.errors[:account].present?
    end
  end

  describe "#create_ops_file" do
    it "should create a file that looks like a server.properties file" do
      server = Server.new
      server.ops << Player.new(:username => 'mconnell')
      server.ops << Player.new(:username => 'readme')
      server.ops << Player.new(:username => 'sylv4n')

      FakeFS.activate!
      generated_file = File.open(server.create_ops_file, 'r')
      FakeFS.deactivate!

      example_file = File.open(Rails.root.join('spec', 'support', 'sample_config_files', 'ops.txt').to_s,'rb').read

      generated_file.each do |line|
        assert example_file.include?(line.strip), "Should include [#{line.strip}]"
      end
    end
  end
end
