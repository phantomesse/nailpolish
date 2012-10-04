namespace :movies do
desc "This task will output the top three ranked movies."
  task :rank_movies do
    require 'csv'
    
    puts "Starting to read CSV..."
    file = "db/movies.csv"

    movies = nil;
    rankings = nil;

    CSV.foreach(file, :headers => false) do |row|
      
      # Initialize array with movie titles
      if movies.nil?
        movies = Array.new(row.size)
        rankings = Array.new(row.size)

        i = 0
        row.each do |element|
          movies[i] = get_movie_title(element)
          rankings[i] = 0
          i = i+1
        end
      end

      # Enter ranking information into arrays
      row.each do |element|
        index = movies.index(get_movie_title(element))
        rankings[index] = rankings[index] + get_movie_ranking(element)
      end
    end

    puts "\nand the top three movies are..."
    number_of_movies = 3
    i = 0
    while i < number_of_movies
      index = rankings.index(rankings.min)
      puts (i+1).to_s + ". " + movies[index]
      movies.delete_at(index)
      rankings.delete_at(index)
      i = i+1
    end

  end
end

def get_movie_title(element)
  return element[element.index(":")+1..element.length]
end

def get_movie_ranking(element)
  return (element[0..element.index(":")-1]).to_i
end
