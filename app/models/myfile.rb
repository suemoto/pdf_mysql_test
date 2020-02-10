class Myfile < ApplicationRecord
  attr_accessor :file
  belongs_to :user

  def self.search(search)
    return Myfile.all unless search
    Myfile.where('title LIKE(?)', "%#{search}%")
  end
end
