class ApartmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :apartment_not_found
  before_action :authorize_user, except: [:index, :show]

  def index
    @apartments = Apartment.active
  end

  def user_index
    @apartments = current_user.apartments
  end

  def show
    @apartment = Apartment.active.find(:id)
  end

  def new
    @apartment = Apartment.new
    apartment.build_address
  end

  def create
    @apartment = current_user.apartments.new(apartment_params)
    apartment.save ? redirect_to(user_apartments_path) : render(:new)
  end

  def edit
    @apartment = user_apartment
    apartment.build_address if apartment && apartment.address.nil?
  end

  def update
    user_apartment.update(apartment_params) ? redirect_to(edit_apartment_path) : render(:edit)
  end

  def destroy
    apartment.destroy
    redirect_to user_apartments_path, danger: 'Apartment has been removed.'
  end

  private

  def apartment
    @apartment ||= Apartment.find(params[:id])
  end

  def user_apartment
    current_user.apartments.find(params[:id])
  end

  def apartment_not_found
    redirect_to apartments_path, notice: 'You do not own an apartment with this id.'
  end

  def apartment_params
    params.require(:apartment).permit(
      :door_number,
      :bedroom_count,
      :bathroom_count,
      :room_description,
      :floor,
      :name,
      :min_guests,
      :max_guests,
      :day_price,
      :week_price,
      :min_stay,
      :active,
      address_attributes: [
        :city,
        :street,
        :zip_code
      ]
    )
  end
end
