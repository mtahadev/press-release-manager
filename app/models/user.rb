class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Assuming a user can author many press releases
  has_many :press_releases, foreign_key: "user_id"
 
  def has_role?(role_name)
    roles.where(name: role_name).any?
  end
end
