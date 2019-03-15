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
    mail(to:@user.email,subject:'contributed a book')
  end
  def borrow_book(user,booksBorrow)
    @user = user
    @booksBorrow = booksBorrow
    mail(to:@user.email,subject:'borrowed a book')
  end
  def borrow_remainder(user,booksBorrow)
    @user = user
    @booksBorrow = booksBorrow
    mail(to:@user.email,subject:'remainder to return the book')
  end
end
