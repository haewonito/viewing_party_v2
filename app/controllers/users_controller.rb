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
  end

  def login_form
  end

  def login_user
    email = params[:email]
    password = params[:password]
    if User.exists?(email: email)
      user = User.where(email: email).first
      if user.authenticate(password)
        redirect_to "/users/#{user.id}"
      else
        flash[:alert] = "You have entered incorrect information."
        redirect_to "/login"
      end
    else
      flash[:alert] = "You have entered incorrect information."
      redirect_to "/login"
    end
  end
end
