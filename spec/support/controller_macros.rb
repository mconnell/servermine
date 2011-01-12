module ControllerMacros
  def login
    before(:each) do
      account = Account.create!(
        :password => 'password',
        :password_confirmation => 'password',
        :email => 'test@servermine.com')
      confirmed_account = Account.confirm_by_token(account.confirmation_token)

      sign_out :account
      sign_in confirmed_account
    end
  end
end

RSpec.configure do |config|
  config.extend ControllerMacros, :type => :controller
end
