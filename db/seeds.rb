# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'

#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
mark = Author.create!(name: "Mark Wanjau")
epharus = Author.create!({name: "Epharus Wangari"})
samuel = Author.create!({name: "Samuel Karanaja"})

15.times do |n|
    categoryarr = ["Sports", "Lifestyle", "Education", "Science", "Technology"]
    Article.create!(title: Faker::Book.title, content: Faker::Books::Lovecraft.paragraphs(number: 5), author_id: mark.id,category: categoryarr.sample)
    Article.create!(title: Faker::Book.title, content: Faker::Books::Lovecraft.paragraphs(number: 5), author_id: epharus.id,category: categoryarr.sample)
    Article.create!(title: Faker::Book.title, content: Faker::Books::Lovecraft.paragraphs(number: 5), author_id: samuel.id,category: categoryarr.sample)
end