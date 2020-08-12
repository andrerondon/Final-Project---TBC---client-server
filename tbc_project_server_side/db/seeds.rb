# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Product.delete_all
User.delete_all

NUM_PRODUCTS = 15
PASSWORD = '12345'


super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    address: '303 victoria dr'
    phone: '999999999'
    password: PASSWORD
)

NUM_USER.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: Faker::Internet.email,
        password: PASSWORD
        address: address
        phone: phone
    )
end

PRICE = '15.00'

NUM_PRODUCTS.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    p = Product.create(
        name: Faker::Hacker.say_something_smart,
        category: Faker::ChuckNorris.fact,
        price: PRICE,
        description: Faker::Hacker.say_something_smart,
        # user: users.sample, # array method that randomly picks something from an array
        created_at: created_at,
        updated_at: created_at
    ) 
    end
end


product = Product.all 
users = User.all

puts Cowsay.say("Generated #{product.count} products", :frogs)
puts Cowsay.say("Generated #{users.count} users", :sheep)