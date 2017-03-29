class User < ActiveRecord::Base
  include BCrypt
  has_many :questions
  has_many :answers
  has_many :answer_votes
  has_many :question_votes


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end
  # Remember to create a migration!
end
