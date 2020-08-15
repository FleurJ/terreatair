class AddMenuTitleToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :menu_title, :string
  end
end
