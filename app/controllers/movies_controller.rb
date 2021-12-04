class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top_rated"
      @movies = MovieFacade.top_movies
    end
  end

  def show
  end
end
