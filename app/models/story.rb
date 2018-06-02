class Story < ApplicationRecord


  belongs_to :board

  validates :name, presence: true
end
