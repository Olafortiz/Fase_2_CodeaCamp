class CoolUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :input
    end
  end
end

