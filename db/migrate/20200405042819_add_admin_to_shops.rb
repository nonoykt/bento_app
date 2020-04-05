class AddAdminToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :admin, :boolean, default: false, null: false
  end
end
