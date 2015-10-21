class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      create_session(@user)
      flash[:notice] = "Welcome To Bloccit, #{@user.name}! Browse the current topics below!"
      redirect_to topics_path
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def confirm
    @user = User.new
    puts "New user created."
    @user.name = params[:user][:name]
    puts "User name is #{@user.name}"
    @user.email = params[:user][:email]
  end


end
