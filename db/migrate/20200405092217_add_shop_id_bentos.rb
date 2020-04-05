class AddShopIdBentos < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM bentos;'
    add_reference :bentos, :shop, null: false, index: true
  end

  def down
    remove_reference :bentos, :shop, index: true
  end
end
