class CreateAssessmentPages < ActiveRecord::Migration[8.0]
  def change
    create_table :assessment_pages do |t|
      t.string :title
      t.text :content
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
