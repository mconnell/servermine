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

  describe "GET #show" do
    before(:each) do
      controller.current_account.servers.stub!(:find).and_return(mock_model(Server))
    end

    it "should be successful" do
      get :show, :id => 123
      assert_response :success
    end

    it "should fetch a server from the current account" do
      controller.current_account.servers.should_receive(:find).with('123')
      get :show, :id => '123'
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

  describe "POST #create" do
    describe "after successfully saving" do
      before(:each) do
        server = mock_model(Server)
        server.stub!(:save).and_return(true)
        controller.current_account.servers.stub!(:build).and_return(server)
      end

      it "should build a new server assigned to current_account" do
        controller.current_account.servers.should_receive(:build).with({})
        post :create, :server => {}
      end

      it "should redirect to the server list" do
        post :create, :server => {}
        assert_redirected_to account_servers_path
      end
    end

    describe "after failing to save" do
      before(:each) do
        server = mock_model(Server)
        server.stub!(:save).and_return(false)
        controller.current_account.servers.stub!(:build).and_return(server)
      end

      it "should render the :new template" do
        post :create, :server => {}
        assert_template :new
      end
    end
  end

end
