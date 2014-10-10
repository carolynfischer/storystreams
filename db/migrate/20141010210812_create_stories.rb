class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :picture
      t.text :description
      t.string :tags
      t.datetime :date

      t.timestamps
    end
  end
end
