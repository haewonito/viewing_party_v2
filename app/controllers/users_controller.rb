class UsersController < ApplicationController
  def index
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    email = params[:email]
    name = params[:name]
    user = User.create(name: name, email: email)

    redirect_to "/users/#{user.id}"
  end
end
