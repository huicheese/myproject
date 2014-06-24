class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
  end

  def new
  	@user = User.new
  end

  def create
   @user = User.new(user_params)    # Not the final implementation!
   if @user.save
   	 flash[:success] = "Welcome to the Sample App!"
     redirect_to @user
   else
     render 'new'
   end
  end

  # def update 
  #   @user = User.find(user_params)
  #   if @user.update_attributes(params[:user])
  #     flash[:success] = "Account updated"
  #     sign_in @user
  #     redirect_to @user
  #   else
  #     render 'edit'
  #   end
  # end

  private

   def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
   end

end
