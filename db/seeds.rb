# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

##Create Admin & Normal User
admin_user = User.find_or_create_by(DEFAULT_ADMIN_USER) do |admin|
  admin.password = 'Book@1234'
end
admin_user.add_role(:admin) if admin_user.present?

normal_user = User.find_or_create_by(DEFAULT_NORMAL_USER) do |user|
  user.password = 'User@1234'
end
normal_user.add_role(:user) if normal_user.present?


Author.first_or_create([{name: 'Erica Jong'}, {name: 'Donald J. Sobol'}, {name: 'Paul Kalanithi'}, {name: 'Mark Twain'}])

Category.first_or_create([{name: 'Spiritual'}, {name: 'Biography'}])

Book.first_or_create([{name: 'Fear of Flying', description: 'Knowing it is my favorite book, for my 34th birthday, a boyfriend once gave me a signed first edition of Erica Jong’s Fear of Flying.', publish_at: DateTime.now, author_id: 1, category_ids: [1]}, {name: 'Encyclopedia Brown', description: ' I was pretty good at figuring out', publish_at: DateTime.now, author_id: 2, category_ids: [2]}])