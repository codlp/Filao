class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :status
      t.date :start_date
      t.date :end_date
      t.integer :user_id, references: "user", index: true
      t.integer :customer_id, references: "user", index: true

      t.timestamps
    end
  end
end
