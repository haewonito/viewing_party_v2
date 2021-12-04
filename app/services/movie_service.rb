class MovieService
  class << self

    def top_movies_page1
      call_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=1")
    end

    def top_movies_page2
      call_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=2")
    end

    private

    def call_api(path)
      response = connection.get(path)
      parse_data(response)
    end

    def connection
      Faraday.new("https://api.themoviedb.org")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
