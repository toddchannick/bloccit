class RatingController < ApplicationController

  def create
    @rating = Rating.find(params[:id])
  end

  def edit
    @rating = Rating.find(params[:id])
  end
end
