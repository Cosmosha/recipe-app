# db/seeds/create_initial_data.rb

# Create users
User.create(name: 'User 1', email: 'user1@example.com', password: 'password123')
User.create(name: 'User 2', email: 'user2@example.com', password: 'password456')

# Create recipes
Recipe.create(name: 'Recipe 1', description: 'Description for Recipe 1', user: User.first, public: true)
Recipe.create(name: 'Recipe 2', description: 'Description for Recipe 2', user: User.first, public: true)
Recipe.create(name: 'Recipe 3', description: 'Description for Recipe 3', user: User.second)
Recipe.create(name: 'Recipe 4', description: 'Description for Recipe 4', user: User.second)
Recipe.create(name: 'Recipe 5', description: 'Description for Recipe 5', user: User.second)
