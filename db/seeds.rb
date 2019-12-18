# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create dummy catetories
10.times do
    Category.create(
        name: Faker::Job.unique.field
    )
end

# Create dummy users
5.times do
    user = User.create(
        full_name: Faker::Name.name,
        email: Faker::Internet.free_email,
        about: Faker::Quote.matz,
        password: '123456',
        from: Faker::Address.country,
        language: Faker::Nation.language,
        created_at: Date.today
    )

    user.avatar.attach(                
        io: image = open("https://i.pravatar.cc/300"),
        filename: "avatar#{user.id}.jpg", 
        content_type: 'image/jpg'
    )
end