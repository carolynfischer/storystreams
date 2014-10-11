class AddColumnCreditsToStory < ActiveRecord::Migration
  def change
    add_column :stories, :credits, :string
  end
end
