Servermine::Application.routes.draw do
  devise_for :accounts, :path => 'account'

  root :to => "account/servers#index"

  namespace :account do
    resources :servers do
      resource :server_properties, :controller => 'servers/server_properties'
    end
  end

end
