class Account::ServersController < AccountController

  def index
    @servers = current_account.servers
  end

  def new
    @server = current_account.servers.build
  end

  def create
    @server = current_account.servers.build(params[:server])
    if @server.save
      redirect_to account_servers_path
    else
      render :new
    end
  end

end
