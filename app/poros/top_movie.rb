class TopMovie
  attr_reader :movie_id, :title, :vote_average, :runtime

  def initialize(data)
    @movie_id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
  end
end
