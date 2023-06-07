class Group < ApplicationRecord
  belongs_to :language
  has_many :words
  has_and_belongs_to_many :tests
end
