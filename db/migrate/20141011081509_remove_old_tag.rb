class RemoveOldTag < ActiveRecord::Migration
  def change
    remove_column :stories, :tags
  end
end
