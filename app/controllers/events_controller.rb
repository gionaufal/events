class EventsController < ApplicationController
  before_action :find_event, only:[:show, :edit, :update]
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      flash[:error] = 'Error creating event'
      render :new
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow "<a href=#{event_path}>#{event.name}</a> <br> #{event.date}"
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      flash[:error] = "Error updating event"
      render :edit
    end
  end
  private

  def event_params
    params.require(:event).permit(:name, :address, :date)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
