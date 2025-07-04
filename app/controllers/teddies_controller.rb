class TeddiesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  def index
    @teddies = Teddy.all
  end

  def show
    @teddy = Teddy.find(params[:id])
  end
end
