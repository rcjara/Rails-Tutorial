class SessionsController < ApplicationController

  def new
    @title = "Sign In"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email or password"
      @title = "Sign In"
      render :action => :new
    else
      signin user
      redirect_to user
    end
  end

  def destroy
    signout
    redirect_to root_path
  end

end
