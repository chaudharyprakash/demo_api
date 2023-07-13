# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

# Create libraries
user = User.create(name: 'Prakash')
library1 = Library.create(name: 'Library 1')
library2 = Library.create(name: 'Library 2')

# Create books for Library 1
library1.books.create(title: 'Book 1', author: 'Author 1', checked_out: false)
library1.books.create(title: 'Book 2', author: 'Author 2', checked_out: true, user: User.first)
library1.books.create(title: 'Book 3', author: 'Author 3', checked_out: false)

# Create books for Library 2
library2.books.create(title: 'Book 4', author: 'Author 4', checked_out: false)
library2.books.create(title: 'Book 5', author: 'Author 5', checked_out: false)
