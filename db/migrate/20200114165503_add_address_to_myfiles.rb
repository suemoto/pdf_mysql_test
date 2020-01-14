class AddAddressToMyfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :myfiles, :address, :string
  end
end
