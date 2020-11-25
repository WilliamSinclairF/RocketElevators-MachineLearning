require 'elevator_media'
class StaticPagesController < ApplicationController
  def index
    @weather = ElevatorMedia::Streamer.get_content
  end

  def residential; end

  def corporate; end
end
