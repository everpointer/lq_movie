class SessionOrdersController < ApplicationController
  def create
    @session_order = SessionOrder.new(params[:session_order])
    @session_order.choosed_seats = JSON.parse(@session_order[:choosed_seats])
    if @session_order.save!
      redirect_to session_order_path(@session_order)
    else
      redirect_to :back
    end
  end

  def show
    @session_order = SessionOrder.find(params[:id]) 
  end
end
