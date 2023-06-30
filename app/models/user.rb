class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User
  enum role: { customer: 0, admin: 1 }
  validates :role, inclusion: { in: roles.keys }
end
