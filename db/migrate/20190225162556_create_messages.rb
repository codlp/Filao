class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :task, foreign_key: true
      t.text :content
      t.date :upload_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
