class TestsWord < ApplicationRecord

    belongs_to :word, dependent: :destroy
    belongs_to :test, dependent: :destroy
end
