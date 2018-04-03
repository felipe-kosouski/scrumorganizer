class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :username, presence: true,
            format: {with: /\[A-Za-z0-9]+(?:[._-][A-Za-z0-9]+)\z/,
                     message: "Only letters, numbers and symbols (. _ -)"}
  validates :email, presence: true,
            format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
end
