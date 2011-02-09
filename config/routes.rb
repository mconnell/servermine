Servermine::Application.routes.draw do
  devise_for :accounts, :path => 'account'

  root :to => "account/servers#index"

  namespace :account do
    resources :servers do
      resource :server_properties, :controller => 'servers/server_properties'
      resource :ops, :controller => 'servers/ops'
      resource :banned_players, :controller => 'servers/banned_players'
      resource :banned_ips, :controller => 'servers/banned_ips'
    end
  end

end
