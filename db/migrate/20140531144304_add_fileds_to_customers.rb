class AddFiledsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :schooling, :string
    add_column :customers, :civil_status, :string
    add_column :customers, :cpf, :string
    add_column :customers, :rg, :string
  end
end
