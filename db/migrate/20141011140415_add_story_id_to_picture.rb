class AddStoryIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :story_id, :integer
  end
end
