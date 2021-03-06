require 'spec_helper'

describe Account::Servers::ServerPropertiesController do
  login

  before(:each) do
    @account = Account.find_by_email 'test@servermine.com'
    @server  = @account.servers.create!
  end

  describe "GET #show" do
    it "should redirect to the edit action" do
      get :show, :server_id => @server.id
      assert_redirected_to :action => :edit
    end
  end

  describe "GET #edit" do
    it "should be successful" do
      get :edit, :server_id => @server.id
      assert_response :success
    end

    it "should assign @server_properties" do
      get :edit, :server_id => @server.id
      assert assigns(:server_properties)
    end
  end

  describe "PUT #update" do
    context "after successful update" do
      it "should redirect to the server #show" do
        put :update, :server_id => @server.id, :server_properties => { 'hellworld' => true }
        assert_redirected_to account_server_path(@server)
      end
    end
  end

end
