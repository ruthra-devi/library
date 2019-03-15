# Preview all emails at http://localhost:3000/rails/mailers/user_mails
class UserMailsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mails/register
  def register
    UserMails.register
  end

end
