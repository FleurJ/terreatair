class AddOrderToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :order, :integer
    add_index :contents, :order, unique: true
  end
end
