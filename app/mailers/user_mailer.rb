class UserMailer < ActionMailer::Base
  # NOTE: Change this to Sidewalk's email whenever it becomes available
  default from: "projectboa@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Project BOA Password Reset"
  end
end
