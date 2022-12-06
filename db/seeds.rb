# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Firdavs');
User.create(name: 'Emil');

# For User with id 1
Article.create(user_id: 1, paragraph: 'Lorem ipsum dolor icum', name: 'Rails and Vanilla JS')
Article.create(user_id: 1, paragraph: 'Lorem ipsum dolor icum', name: 'Learning Flutter')
Article.create(user_id: 1, paragraph: 'Lorem ipsum dolor icum', name: 'Debug and clean code')
Article.create(user_id: 1, paragraph: 'Lorem ipsum dolor icum', name: 'Performant SQL queries')

# For User with id 2
Article.create(user_id: 2, paragraph: 'Lorem ipsum dolor icum', name: 'Pratise FreeCodeCamp')
Article.create(user_id: 2, paragraph: 'Lorem ipsum dolor icum', name: 'Follow YouTube Gurus')
Article.create(user_id: 2, paragraph: 'Lorem ipsum dolor icum', name: 'Learning from books')
Article.create(user_id: 2, paragraph: 'Lorem ipsum dolor icum', name: 'Good communication')

