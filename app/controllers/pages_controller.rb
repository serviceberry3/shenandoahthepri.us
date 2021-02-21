class PagesController < ApplicationController
  def car
  end

  def show
    if params[:page] == "maps"
      maps
    elsif params[:page] == "car"
      car
    else
      stats
    end
    
  end

  def maps
    @tracks = Track.all
    render template: "pages/maps"
  end

  def car
    @tracks = Track.all
    render template: "pages/car"
  end

  def stats
    @tracks = Track.all
    render template: "pages/stats"
  end
end
