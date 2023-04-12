class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.client_id = current_user.id
    @order.caregiver = @caregiver

    raise

    if @order.save
      redirect_to order_path(current_user), notice: 'Seja bem-vindo(a)!'
    else
      render :new
    end
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
