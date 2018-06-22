class User < ApplicationRecord
  rolify

  ROLES = %w[manager master developer]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]*[_|-|.]*[a-zA-Z0-9]*\z/
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  mount_uploader :picture, PictureUploader

  validates :name, presence: true
  validates :username, presence: true,
            format: {with: VALID_USERNAME_REGEX,
                     message: "Somente letras, numeros e simbolos (. _ -)"}
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX}
  validate :picture_size

  has_many :projects
  has_many :users_projects
  has_many :shared_projects, through: :users_projects, source: :project

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "A imagem deve ser menor que 5MB")
    end
  end
end
