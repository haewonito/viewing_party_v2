class MovieFacade

  def top_movie_objects
    data = MovieService.top_movies_data

    data[:results].map do |movie_data|
      TopMovie.new(movie_data)
    end
  end

end
