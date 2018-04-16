class Board < ApplicationRecord
  acts_as_list

  belongs_to :project

  validates :name, presence: true
  validates :position, presence: true
end
