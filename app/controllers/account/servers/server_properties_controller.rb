class Account::Servers::ServerPropertiesController < ApplicationController
  before_filter :find_server

  def show
    redirect_to :action => :edit
  end

  def edit
    @server_properties = @server.server_properties
  end

  def update
    @server_properties = @server.server_properties
    if @server_properties.update_attributes(params[:server_properties])
      redirect_to [:account, @server]
    else
      render :action => :edit
    end
  end

  private
  def find_server
    @server = current_account.servers.find(params[:server_id])
  end
end
