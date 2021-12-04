class MovieFacade
  class << self

    def top_movies
      data1 = MovieService.top_movies_page1
      data2 = MovieService.top_movies_page2

      top_movies1 = data1[:results].map do |movie_data|
        TopMovie.new(movie_data)
      end

      top_movies2 = data2[:results].map do |movie_data|
        TopMovie.new(movie_data)
      end

      top_movies1 + top_movies2
    end

  end
end
