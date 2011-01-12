Servermine::Application.routes.draw do
  devise_for :accounts, :path => 'account'

  root :to => "account/servers#index"

  namespace :account do
    resources :servers
  end

end
