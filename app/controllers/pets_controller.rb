class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :user_find, only: [:new, :create]
  before_action :move_to_root_path, only: [:new, :create]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :image, :pet_type_id, :feature, :birthday, :age).merge(user_id: current_user.id)
  end

  def user_find
    @pet_user = User.find(params[:user_id])
  end

  def move_to_root_path
    redirect_to root_path unless current_user == @pet_user
  end

end
