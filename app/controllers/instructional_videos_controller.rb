class InstructionalVideosController < ApplicationController
  def new
    @instructional = InstructionalVideo.new
  end

  def create
    @video = InstructionalVideo.new(video_params)
    if @video.save
      flash[:notice] = 'Video uploaded.'
      redirect_to positions_path
    else
      flash[:notice] = 'Upload failed.'
      render :new
    end
  end

  private

  def video_params
    params.require(:instructional_video).permit(:title)
  end
end
