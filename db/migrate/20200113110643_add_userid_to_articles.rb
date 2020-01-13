class AddUseridToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :myfiles, :user,index: true
  end
end
