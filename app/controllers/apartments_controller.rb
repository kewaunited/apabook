class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.active
  end

  def show
    @apartment = Apartment.active.find(:id)
  end

  def new
  end

  def create
  end
end
