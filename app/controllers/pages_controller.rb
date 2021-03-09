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
    @cities = City.all
    @tracks = Track.all
    @journals = Journal.all
    render template: "pages/maps"
  end

  def car
    @tracks = Track.all
    render template: "pages/car"
  end

  def stats
    odo = 161478
    @tracks = Track.all

    Track.all.each do |track|
      if track.date >= Date.parse('2021-02-21')
        odo += track.distance
      end
    end

    #save odometer sum as instance var, available to the view
    @odo = odo

    render template: "pages/stats"
  end
end
