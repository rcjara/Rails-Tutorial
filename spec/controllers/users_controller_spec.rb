require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do 
    @main_title = "Ruby on Rails Tutorial"
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do 
      get 'new'
      response.should have_selector("title", :content => "Sign Up")
    end

    it "should have a user" do
      @user.nil?.should == false
    end
  end
end
