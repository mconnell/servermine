class Account::Servers::ServerPropertiesController < ApplicationController
  before_filter :find_server

  def show
    redirect_to :action => :edit
  end

  def edit
    @server_properties = @server.server_properties
  end

  private
  def find_server
    @server = current_account.servers.find(params[:server_id])
  end
end
