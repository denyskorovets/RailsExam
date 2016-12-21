class UsersController < ApplicationController
  before_action :require_login, except: [:create]
  def create
  	@user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/bright_ideas"
    else
      puts "error creating user"
      flash[:register_notice] = @user.errors.full_messages
      render '/sessions/index'
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show'
  end

    private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
