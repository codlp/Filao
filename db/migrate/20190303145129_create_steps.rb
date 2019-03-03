class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.boolean :is_completed
      t.float :completion

      t.timestamps
    end
  end
end
