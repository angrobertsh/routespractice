class Jasdfkl < ActiveRecord::Migration
  def change
    add_column :contact_shares, :favorite, :boolean
    add_column :contacts, :favorite, :boolean

  end
end
