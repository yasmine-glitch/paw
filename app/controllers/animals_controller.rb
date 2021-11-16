class AnimalsController < ApplicationController
  def index
    @animals = policy_scope(Animal).order(created_at: :desc)
  end

  def show
    @animal = Animal.find(params[:id])
    authorize @animal
  end

  def new
    @animal = Animal.new
    authorize @animal
    @user = current_user
  end

  def create
    @animal = Animal.new(animal_params)
    authorize @animal
    @animal.user = current_user
    if @animal.save!
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    authorize @animal
  end

  def update
    @animal = Animal.find(params[:id])
    authorize @animal
    @animal.update(animal_params)
    redirect_to animal_path
  end

  def destroy
    @animal = Animal.find(params[:id])
    authorize @animal
    @animal.destroy
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :address, :price, :photos, :description, :quality, :species)
  end
end
