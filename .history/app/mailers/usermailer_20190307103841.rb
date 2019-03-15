class Usermailer < ApplicationMailer
    def register(user)
        @user = user
        @greeting = "Hi"
    
        mail to: @user.email,subject: "Welcome"
      end
end
