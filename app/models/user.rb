class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  def has_role?(role_name)
    roles.where(name: role_name).any?
  end
end
