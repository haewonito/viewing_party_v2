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
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    user = User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)

    if user.errors.any?
      redirect_to "/users"
      error_message = user.errors.full_messages.first
      flash[:error] = error_message
    elsif user.save
      redirect_to "/users/#{user.id}"
    end


    #
    # if password != password_confirmation
    #   flash[:alert] = "The passwords don't match. Try again."
    #   redirect_to register_path
    # elsif name = nil
    #
    #   redirect_to register_path
    # else
      # user = User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
      # redirect_to "/users/#{user.id}"
    # end
  end
end
