class ChangeBentosNameNull < ActiveRecord::Migration[5.2]
  def up
    change_column :bentos, :name, :string, null: false
  end

  def down
    change_column :bentos, :name, :string
  end
end
