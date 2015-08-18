class ApartmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :apartment_not_found
  before_action :authorize_user, except: [:index, :show]

  def index
    if params
      @apartments = Apartment.search(params)
    else
      @apartments = Apartment.active
    end
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

  helper_method :present_cities
  helper_method :present_bedroom_counts
  helper_method :present_bathroom_counts
  helper_method :present_guest_counts

  private

  def apartment
    @apartment ||= Apartment.find(params[:id])
  end

  def present_cities
    Address.pluck(:city).uniq
  end

  def present_bedroom_counts
    Apartment.active.pluck(:bedroom_count).uniq
  end

  def present_bathroom_counts
    Apartment.active.pluck(:bathroom_count).uniq
  end

  def present_guest_counts
    (1..Apartment.maximum('max_guests')).to_a
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
      ],
      image_attributes: [
        :image,
        :remove_image
      ]
    )
  end
end
