class GripsController < ApplicationController

  def show
    @grip = Grip.includes(:instructional_videos, :major_categories).find(params[:id])
  end
end
