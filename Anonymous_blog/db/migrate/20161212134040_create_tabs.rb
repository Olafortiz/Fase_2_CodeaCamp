class CreateTabs < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author, default: 'Anonymous'
      t.timestamps
    end

    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end

    create_table :post_tags do |t|
      t.belongs_to :post
      t.belongs_to :tag
      t.timestamps
    end

  end
end
