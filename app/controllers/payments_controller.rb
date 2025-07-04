class PaymentsController < ApplicationController
  def new
    @order = Current.user.orders.where(state: "pending").find(params[:order_id])
  end
end
