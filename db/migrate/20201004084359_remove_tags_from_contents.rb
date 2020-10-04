class RemoveTagsFromContents < ActiveRecord::Migration[5.2]
  def change
    remove_column :contents, :tags
  end
end
