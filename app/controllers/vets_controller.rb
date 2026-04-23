class VetsController < ApplicationController
  def index
    @vets = Vet.all
  end

  def show
    @vet = Vet.find(params[:id])
    @upcoming_appointments = @vet.appointments.upcoming.includes(:pet)
  end
end