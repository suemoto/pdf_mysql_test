class Myfile < ApplicationRecord
  attr_accessor :file
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :art_tag

  def self.search(search)
    return Myfile.all unless search
    Myfile.where('title LIKE(?)', "%#{search}%")
  end
  def self.tag_search(tag)
    Myfile.where(art_tags_id = tag)
  end
end
