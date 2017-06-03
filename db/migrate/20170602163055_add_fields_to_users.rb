class AddFieldsToUsers < ActiveRecord::Migration[5.1]
   def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :tag, :string    
    add_column :users, :dob, :datetime
    add_column :users, :gender, :boolean
    add_column :users, :address, :text
    add_column :users, :phone_no, :integer
  end
end
