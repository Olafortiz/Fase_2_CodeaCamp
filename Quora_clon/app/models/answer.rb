class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  
  validates :answer_body, uniqueness: {message: "already exists"}
  validates_presence_of :answer_body, :message => "can't be empty"
  # Remember to create a migration!



end