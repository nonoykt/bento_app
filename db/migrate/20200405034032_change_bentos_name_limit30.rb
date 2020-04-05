class ChangeBentosNameLimit30 < ActiveRecord::Migration[5.2]
  def up
    change_column :bentos, :name, :string, limit: 30
  end

  def down
    change_column :bentos, :name, :string
  end
end
