class AddArtTagsToMyfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :myfiles, :art_tags_id, :integer
  end
end
