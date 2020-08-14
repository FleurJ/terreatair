class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :teaser
      t.text :body
      t.string :links
      t.string :status
      t.references :user, foreign_key: true
      t.string :slug
      t.string :tags

      t.timestamps
    end
    add_index :contents, :slug, unique: true
  end
end
