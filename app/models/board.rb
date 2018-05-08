class Board < ApplicationRecord
  belongs_to :project
  has_many :stories , -> { order(position: :asc)}, dependent: :destroy

  scope :sorted, -> { order(position: :asc)}
  validates :name, presence: true
  validates :position, presence: true
end
