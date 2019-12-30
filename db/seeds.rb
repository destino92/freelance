# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# Create dummy categories
10.times do
    Category.create(
        name: Faker::Job.unique.field
    )
end

# Create dummy users
# 5.times do
#     user = User.create(
#         full_name: Faker::Name.name,
#         email: Faker::Internet.free_email,
#         about: Faker::Quote.matz,
#         password: '123456',
#         from: Faker::Address.country,
#         language: Faker::Nation.language,
#         created_at: Date.today
#     )

#     user.avatar.attach(                
#         io: image = open("https://i.pravatar.cc/300"),
#         filename: "avatar#{user.id}.jpg", 
#         content_type: 'image/jpg'
#     )
# end

# Create dummy Requests

# 10.times do
#     random_user = User.all.sample(1)[0]
#     category = Category.all.sample(1)[0]
#     request = Request.create(
#         title: Faker::Job.title,
#         description: Faker::Quote.matz,
#         budget: Faker::Number.between(5, 50),
#         delivery: Faker::Number.between(1, 10),
#         user_id: random_user.id,
#         category_id: category.id
#     )
# end

10.times do
    random_user = User.all.sample(1)[0]
    category = Category.all.sample(1)[0]
    gig = Gig.create(
        title: Faker::Job.unique.title,
        description: Faker::Quote.matz,
        active: Faker::Boolean.boolean,
        user_id: random_user.id,
        category_id: category.id
    )
    number = Faker::Number.between(1, 3)
    gig.photos.attach(
        io: File.open("app/assets/images/gig_cover_#{number}.jpg"),
        filename: "category_#{number}.jpeg"
    )    
    gig.pricings.create(
        pricing_type: 0,
        title: Faker::Job.title,
        description: Faker::Quote.matz,
        price: Faker::Number.between(1, 9),
        delivery_time: Faker::Number.between(20, 30),
    )
    gig.pricings.create(
        pricing_type: 1,
        title: Faker::Job.title,
        description: Faker::Quote.matz,
        price: Faker::Number.between(10, 19),
        delivery_time: Faker::Number.between(10, 19),
    )
    gig.pricings.create(
        pricing_type: 2,
        title: Faker::Job.title,
        description: Faker::Quote.matz,
        price: Faker::Number.between(20, 35),
        delivery_time: Faker::Number.between(1, 10),
    )
end
