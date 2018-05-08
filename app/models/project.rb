class Project < ApplicationRecord
  belongs_to :user
  has_many :users_projects
  has_many :collaborators, through: :users_projects, source: :user

  has_many :boards

  validates :name, presence: true
  #validates :user_id, presence: true
end
