class ExampleMailer < ApplicationMailer
   default from: "ruthra1206@gmail.com"
   def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    render plain: "message sent"
  end
  def contribute_book(user,book)
    @user = user
    @book = book
    mail(to:@user.email,subject:'Borrowed a book')
  end
end
