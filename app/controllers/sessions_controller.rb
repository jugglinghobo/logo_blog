class SessionsController < ApplicationController


  def new

  end

  def create
    user = User.find_by_email params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      redirect_to user, :notice => "Login Successful"
    else
      flash.now[:alert] = "Incorrect"
      render 'new'
    end
  end

  def destroy

  end
end
