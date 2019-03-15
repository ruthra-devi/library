class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to :controller => 'books', :action => 'index' 
    end
  end
  def create
      
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        UserMails.register(user).deliver_now
        ExampleMailer.welcome_email(user).deliver_now
        flash.now[:success] = 'successfully logged in'
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to '/users/new'
  end
end