class CaregiversController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[new create]

  def index
    @caregivers = Caregiver.all
    @markers = @caregivers.geocoded.map do |caregiver|
    {
      lat: caregiver.latitude,
      lng: caregiver.longitude,
      info_window: render_to_string(partial: "info_window", locals: {caregiver: caregiver})
    }
  end

  end

  def new
    @caregiver = Caregiver.new
  end

  def show
    @caregiver = Caregiver.find(params[:id])
    @markers = [
        {
          lat: @caregiver.latitude,
          lng: @caregiver.longitude,
          info_window: "<div><i class='page-title fa-solid fa-location-dot text-primary'></i> <strong>Lat:</strong> #{@caregiver.latitude} <strong class='text-primary'>-</strong> <strong>Long:</strong> #{@caregiver.longitude}
                        </div>"
        }
      ]
  end

  def create
    @caregiver = Caregiver.new(caregiver_params)
    @caregiver.address = @caregiver.street + "," + @caregiver.city
    if @caregiver.save
      redirect_to root_path, notice: 'Seja bem-vindo(a)!'
    else
      render :new
    end
  end

  private
  def caregiver_params
    params.require(:caregiver).permit(
    :email,
    :encrypted_password,
    :reset_password_sent_at,
    :remember_created_at,
    :created_at,
    :updated_at,
    :first_name,
    :last_name,
    :type,
    :address,
    :street,
    :number,
    :district,
    :complement,
    :city,
    :latitude,
    :longitude,
    :password,
    :value,
    :care_type,
    :formation,
    :photo
    )
  end
end
