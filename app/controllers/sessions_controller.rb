class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:email])
    if user.nil?
      flash[:error] = "Invalid email or password"
      render :action => "new"
    else

    end
  end

  def destroy
  end

end
