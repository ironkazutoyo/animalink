class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]


  def show
    @user = User.find(params[:id])
    @pet = Pet.find(@user.pets.ids)
  end

  private


end
