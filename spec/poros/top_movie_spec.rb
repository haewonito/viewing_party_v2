require 'rails_helper'

RSpec.describe TopMovie do
  it 'has attributes' do
    movie = TopMovie.new(movie_test_data)

    expect(movie.title).to eq('The Godfather')
    expect(movie.vote_average).to eq(8.7)
    expect(movie.movie_id).to eq(238)
    expect(movie.runtime).to eq(175)
  end
end
