class User < ActiveRecord::Base
  attr_accessible \
    :username,
    :email,
    :password,
    :password_confirmation,
    :first_name,
    :last_name,
    :rank,
    :gym,
    :about

  has_secure_password
  validates_presence_of :password, on: :create
  validates_presence_of :username, on: :create
  validates_presence_of :email,    on: :create

  def send_password_reset
    generate_token(:password_reset_token)
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
