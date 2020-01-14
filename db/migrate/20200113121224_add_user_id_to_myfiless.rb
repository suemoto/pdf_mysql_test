class AddUserIdToMyfiless < ActiveRecord::Migration[5.2]
  def change
    add_reference :myfiles, :user, foreign_key: true
  end
end
