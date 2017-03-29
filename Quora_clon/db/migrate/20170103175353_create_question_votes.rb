class CreateQuestionVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.integer :votes, default: 0
    end
  end
end
