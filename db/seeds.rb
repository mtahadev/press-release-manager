# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Roles
roles = ['admin', 'editor', 'contributor']
roles.each do |role|
  Role.find_or_create_by(name: role)
end

# Create a sample user
user = User.find_or_initialize_by(email: 'admin@example.com')
if user.new_record?
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
  user.add_role :admin
end

# Create sample organizations
org1 = Organization.find_or_create_by(name: 'Tech Innovations', description: 'A leading company in tech innovations.')
org2 = Organization.find_or_create_by(name: 'Green Energy Solutions', description: 'Focused on renewable energy solutions.')

# Create sample publishers associated with organizations
pub1 = Publisher.find_or_create_by(name: 'Tech News Daily', description: 'Latest updates in technology.', organization: org1)
pub2 = Publisher.find_or_create_by(name: 'Renewable Now', description: 'Covering the future of green energy.', organization: org2)

# Create sample press releases
PressRelease.find_or_create_by(title: 'New Tech Frontier', content: 'Exploring the new frontier in technology.', publish_date: Time.now, status: :published, publisher: pub1, author: user)
PressRelease.find_or_create_by(title: 'Sustainable Future', content: 'How green energy is paving the way for a sustainable future.', publish_date: Time.now, status: :published, publisher: pub2, author: user)
