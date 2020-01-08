class CreateMyfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :myfiles do |t|
      t.string :title
      t.string :filename
      t.string :comment

      t.timestamps
    end
  end
end
