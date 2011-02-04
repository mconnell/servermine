require 'spec_helper'

describe ServerProperties do

  describe "#create_file" do
    it "should create a file that looks like a server.properties file" do
      server_properties = ServerProperties.new({
        :level_name     => 'world',
        :hellworld      => false,
        :spawn_monsters => true,
        :online_mode    => true,
        :spawn_animals  => true,
        :max_players    => 20,
        :server_ip      => nil,
        :pvp            => true,
        :server_port    => 25565
      })

      FakeFS.activate!
      generated_file = File.open(server_properties.create_file, 'r')
      FakeFS.deactivate!

      example_file = File.open(Rails.root.join('spec', 'support', 'sample_config_files', 'server.properties').to_s,'rb').read

      generated_file.each do |line|
        assert example_file.include?(line.strip), "Should include [#{line.strip}]"
      end
    end
  end
end
