class TracksController < ApplicationController
  def index
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(filename: "...", date: "...", distance: "...", elev_change: "...", duration: "...")

    if @track.save
    else
    end
  end
end
