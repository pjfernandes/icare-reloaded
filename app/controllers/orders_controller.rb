class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if current_user.type == "Client"
      @orders = Order.where(client_id: current_user.id)
    else
      @orders = Order.where(caregiver_id: current_user.id)
    end
  end

  def new
    @caregiver = Caregiver.find(params[:caregiver_id])
    @order = Order.new
  end

  def create
    @caregiver = Caregiver.find(params[:caregiver_id])
    @order = Order.new(order_params)
    @order.caregiver_id = @caregiver.id
    @order.client_id = current_user.id

    if @order.save
      redirect_to orders_path, notice: 'Pedido enviado!'
    else
      render :new
    end
  end

  def update
    order = Order.find(params[:id])
    order.caregiver_accept = true
    order.save
    redirect_to orders_path
  end


  private
  def order_params
    params.require(:order).permit(
    :caregiver_id,
    :client_id,
    :total_price,
    :payment_status,
    :payment_type,
    :caregiver_accept,
    :days
    )
  end
end
