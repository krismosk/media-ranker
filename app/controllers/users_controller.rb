class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user= User.find_by(id: params[:id])
    if @user.nil?
      head :not_found
      return
    end
  end

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.find_by(uid: auth_hash[:uid], provider: "github")
    # Check if there's a User record matching the uid and provider credentials in DB
    if user
      # User was found in the database
      flash[:success] = "Logged in as returning user #{user.name}"
    else
      # User doesn't match anything in the DB
      # Attempt to create a new user
      user = User.build_from_github(auth_hash)

      if user.save
        flash[:success] = "Logged in as new user #{user.name}"
      else
        # Couldn't save the user for some reason. If we
        # hit this it probably means there's a bug with the
        # way we've configured GitHub. Our strategy will
        # be to display error messages to make future
        # debugging easier.
        flash[:error] = "Could not create new user account: #{user.errors.messages}"
        return redirect_to root_path
      end
    end

    # If User successfully create save User ID in session
    # If we get here, we have a valid user instance
    session[:user_id] = user.id
    return redirect_to root_path
  end 

  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end 

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"

    redirect_to root_path
  end

  private

  def find_user
    @user= User.find_by(id: params[:id])
  end 
end
