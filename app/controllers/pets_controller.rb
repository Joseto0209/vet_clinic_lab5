class PetsController < ApplicationController
  def index
    @pets = Pet.includes(:owner).all
  end

  def show
    @pet = Pet.includes(:appointments).find(params[:id])
  end
end