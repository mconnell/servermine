class AccountController < ApplicationController
  before_filter :authenticate_account!
end
