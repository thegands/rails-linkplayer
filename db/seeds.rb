# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'test@test.com', password: 'testtest', role: :admin).playlists.create(title: 'First Playlist', user: User.first).links.create(url: 'http://www.w3schools.com/html/mov_bbb.mp4')
# Playlist.create(title: 'First Playlist', user: User.first).links.create(url: 'http://www.w3schools.com/html/mov_bbb.mp4')
# Link.create(url: 'http://www.w3schools.com/html/mov_bbb.mp4', playlist: Playlist.first)
