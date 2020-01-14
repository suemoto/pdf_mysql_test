class Myfile < ApplicationRecord
  attr_accessor :file
  belongs_to :user
end
