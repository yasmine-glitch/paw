class ReservationsController < ApplicationController
  # As a user, I can see my reservation
  def show
    @reservation = Reservation.find(params[:id])
  end

  # As a user, I want to book an animal (step 1/2)
  def new
    # identify the reservation user
    @user = current_user
    # identify the reservation animal
    @animal = Animal.find(params[:animal_id])

    authorize @animal
    # create the reservation
    @reservation = Reservation.new
  end

  # As a user, I want to book an animal (step 2/2)
  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @reservation.user = @user
    @animal = Animal.find(params[:animal_id])
    @reservation.animal = @animal
    if @reservation.save
      redirect_to animal_reservation_path(@animal, @reservation)
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :address)
  end
end
