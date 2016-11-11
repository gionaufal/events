class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    end
  end

  def show
    @event = Event.find(params[:id])
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow "<a href=#{event_path}>#{event.name}</a> <br> #{event.date}"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :date)
  end
end
