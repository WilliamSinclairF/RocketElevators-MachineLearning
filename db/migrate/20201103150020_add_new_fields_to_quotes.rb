class AddNewFieldsToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :full_name, :string
    add_column :quotes, :email, :string
    add_column :quotes, :phone, :string
  end
end
