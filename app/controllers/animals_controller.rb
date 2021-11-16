class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
    @user = current_user
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save!
      redirect_to animals_path
    else
      render :new
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animal_path(@animal)
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :address, :price, :photos)
  end
end
