class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :pet_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]


  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to user_path(@pet.user_id)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to user_pet_path
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to user_path(@pet.user_id)
  end


  private

  def pet_params
    params.require(:pet).permit(:name, :image, :pet_type_id, :feature, :birthday, :age).merge(user_id: current_user.id)
  end

  def pet_find
    @pet = Pet.find(params[:user_id])
  end

  def move_to_root_path
    redirect_to root_path unless current_user == @pet.user
  end

end
