require 'spec_helper'

describe Account::ServersController do
  login

  describe "responding to GET #index" do
    it "should be successful" do
      get :index
      assert_response :success
    end

    it "should assign @servers" do
      get :index
      assert assigns(:servers)
    end
  end

end
