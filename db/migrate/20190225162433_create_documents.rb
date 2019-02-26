class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :task, foreign_key: true
      t.string :name
      t.date :upload_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
