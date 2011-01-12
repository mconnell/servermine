require 'spec_helper'

describe Account::ServersController do
  login

  describe "GET #index" do
    it "should be successful" do
      get :index
      assert_response :success
    end

    it "should assign @servers" do
      get :index
      assert assigns(:servers)
    end
  end

  describe "GET #new" do
    it "should be successful" do
      get :new
      assert_response :success
    end

    it "should build a new server assigned to current_account" do
      controller.current_account.servers.should_receive(:build)
      get :new
    end

    it "should assign new server object to @server" do
      get :new
      assert assigns(:server).is_a? Server
      assert assigns(:server).new_record?
    end
  end

end
