require 'json'
require 'open-uri'

puts "Cleaning db.."
Movie.destroy_all

puts "Seeding.."

5.times do |i|
  url = "http://tmdb.lewagon.com/movie/top_rated?page=#{i + 1}"
  base_poster_url = "https://image.tmdb.org/t/p/original"

  movies_read = URI.open(url).read
  movies = JSON.parse(movies_read)

  movies['results'].each do |movie|
      seed = Movie.create!(
        title: movie['original_title'],
        overview: movie['overview'],
        poster_url: "#{base_poster_url}#{movie['poster_path']}",
        rating: movie['vote_average']
      )
      puts "Seed #{seed.id} created!"
  end
end
