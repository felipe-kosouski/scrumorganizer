class Project < ApplicationRecord
  belongs_to :user
  has_many :boards

  validates :name, presence: true
  validates :user_id, presence: true
end
