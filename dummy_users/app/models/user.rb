class User < ActiveRecord::Base

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {in: 6..15}
  # Remember to create a migration!


 

  # ej. User.authenticate('fernando@codea.mx', 'qwerty')
  def self.authenticate(email, password)

    User.find_by(email: email, password: password)   
  end




end
