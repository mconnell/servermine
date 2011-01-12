class Account::ServersController < AccountController

  def index
    @servers = current_account.servers
  end

end
