class ClientsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    #@client.user = current_user
    if @client.save
      redirect_to root_path, notice: 'Seja bem-vindo(a)!'
    else
      render :new
    end
  end

  private
  def client_params
    params.require(:client).permit(
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
    :password
    )
  end
end
