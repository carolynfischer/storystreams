class AddCollumnUserIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :user_id, :integer
  end
end
