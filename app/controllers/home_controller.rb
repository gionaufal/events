class HomeController < ApplicationController
  def index
    @events = Event.all.order(:date)
    @tags = Event.distinct.pluck(:tag)
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow "<a href=#{event_path(event)}>#{event.name}</a> <br> #{event.date}"
    end
  end

  def tag
    @events = Event.find_by(tag: params[:id])
  end
end
