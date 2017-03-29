class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :body, uniqueness: {message: "already exists"}
  validates_presence_of :body, :message => "can't be empty"
  # Remember to create a migration!
end
