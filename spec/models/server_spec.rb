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
    it "should create a file that looks like a ops.txt file" do
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

  describe "#create_banned_players_file" do
    it "should create a file that looks like a banned_players.txt file" do
      server = Server.new
      server.ops << Player.new(:username => 'bad_player')
      server.ops << Player.new(:username => 'very_bad_player')
      server.ops << Player.new(:username => 'arsehole')

      FakeFS.activate!
      generated_file = File.open(server.create_banned_players_file, 'r')
      FakeFS.deactivate!

      example_file = File.open(Rails.root.join('spec', 'support', 'sample_config_files', 'banned_players.txt').to_s,'rb').read

      generated_file.each do |line|
        assert example_file.include?(line.strip), "Should include [#{line.strip}]"
      end
    end
  end

  describe "#create_banned_ips_file" do
    it "should create a file that looks like a banned_ips.txt file" do
      server = Server.new
      server.banned_ips << Ip.new(:address => '192.168.1.255')
      server.banned_ips << Ip.new(:address => '127.0.0.1')
      server.banned_ips << Ip.new(:address => '10.0.0.1')

      FakeFS.activate!
      generated_file = File.open(server.create_banned_ips_file, 'r')
      FakeFS.deactivate!

      example_file = File.open(Rails.root.join('spec', 'support', 'sample_config_files', 'banned_ips.txt').to_s,'rb').read

      generated_file.each do |line|
        assert example_file.include?(line.strip), "Should include [#{line.strip}]"
      end
    end
  end
end
