class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @furnitures = Furniture.where(user: @user)
    @housings = Housing.where(user: @user)
  end
end
