class UsersController < ApplicationController
  def new
    if logged_in?
      redirect_to :controller => 'books', :action => 'index' 
    else
      @user = User.new
    end
      
  end
  def create
    @user = User.new(user_params)
    if @user.save
      
      flash[:success] = "Successfully signed up!!"
      render plain: ExampleMailer.welcome_email(@user).deliver_now
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
   
  end
  def index
    @users = User.all
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end