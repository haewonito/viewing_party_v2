class MovieFacade
  class << self

    def top_movies
      data1 = MovieService.call_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=1")
      data2 = MovieService.call_apicall_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=2")

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
#
# /3/movie/#{id}?language=en-US&api_key=05946dc2dc50df636962153f45926dbe"
# /3/movie/#{id}/credits?&language=en-US&api_key=05946dc2dc50df636962153f45926dbe"
# 3/movie/#{id}/reviews?&language=en-US&api_key=05946dc2dc50df636962153f45926dbe")
