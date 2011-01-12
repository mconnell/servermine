class Account::ServersController < AccountController

  def index
    @servers = current_account.servers
  end

  def new
    @server = current_account.servers.build
  end

end
