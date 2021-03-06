class Account::Servers::BannedPlayersController < ApplicationController
  layout 'server'
  before_filter :find_server

  def show
    redirect_to :action => :edit
  end

  def edit
    @banned_players = @server.banned_players
  end

  def update
    if @server.update_attributes(params[:server])
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
