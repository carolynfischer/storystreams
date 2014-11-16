class AddCoverPictureIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :cover_picture_id, :integer
  end
end
