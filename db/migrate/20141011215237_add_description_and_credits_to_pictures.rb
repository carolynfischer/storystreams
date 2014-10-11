class AddDescriptionAndCreditsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :description, :string
    add_column :pictures, :credits, :string
  end
end
