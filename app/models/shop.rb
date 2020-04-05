class Shop < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :owner, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :bentos

end
