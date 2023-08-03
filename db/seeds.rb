# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Admin.find_by(email: 'admin@admin.com').nil?
    Admin.create!(
        email: 'admin@admin.com',
        password: "admin123")
end

if Owner.find_by(email: 'owner1@owner.com').nil?
    Owner.create!(
        hospital_id: 16,
        email: 'owner1@owner.com',
        password: "owner123")
end