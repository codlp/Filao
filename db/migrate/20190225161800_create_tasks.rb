class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.text :description
      t.string :status
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.boolean :deliverable, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
