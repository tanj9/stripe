class OrdersController < ApplicationController
  def create
    teddy = Teddy.find(params[:teddy_id])
    order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: "pending", user: Current.user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      line_items: [ {
        quantity: 1,
        price_data: {
          unit_amount: teddy.price_cents.to_i,
          currency: "eur",
          product_data: {
            name: teddy.sku
          }
        }
      } ],
      mode: "payment",
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end
