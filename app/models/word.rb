class Word < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :tests
  belongs_to :group
end
