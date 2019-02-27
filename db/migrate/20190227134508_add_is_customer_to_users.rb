class AddIsCustomerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_customer, :boolean, default: false
  end
end
