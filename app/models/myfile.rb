class Myfile < ApplicationRecord
  attr_accessor :file
  belongs_to :user

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
