class PositionsController < ApplicationController
  def index
    @top = Position.includes(:sub_positions, :grips).where(top: true)
    @bottom = Position.includes(:sub_positions, :grips).where(top: false)
    @neutral = Position.includes(:sub_positions, :grips).where(top: nil)
  end
end
