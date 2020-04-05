class AddOwnerToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :owner, :string, null: false
  end
end
