class MoviesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    if params[:q] == "top_rated"
      @top_movies = MovieFacade.top_movies
    end
  end

  def show
    @user = User.find(session[:user_id])
    # @movie = MovieFacade.find(params[:id])
  end
end
