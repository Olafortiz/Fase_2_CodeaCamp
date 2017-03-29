class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.belongs_to :user
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
