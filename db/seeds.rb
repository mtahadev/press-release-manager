# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create roles
admin_role = Role.create(name: 'admin')
manager_role = Role.create(name: 'manager')

# Create users
admin_user = User.create(email: 'admin@example.com', password: 'password')
manager_user = User.create(email: 'manager@example.com', password: 'password')

# Assign roles to users
admin_user.roles << admin_role
manager_user.roles << manager_role