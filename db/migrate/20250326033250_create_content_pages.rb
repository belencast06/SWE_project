class CreateContentPages < ActiveRecord::Migration[8.0]
  def change
    create_table :content_pages do |t|
      t.string :title
      t.text :body
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
