class EventsController < ApplicationController
  before_action :find_event, only:[:show, :edit, :update, :destroy]
  
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

  def destroy
    @event.destroy
    redirect_to root_path
  end

  def index
    @events = Event.all.order(:date)
  end

  def import
    Event.import(params[:file])
    redirect_to root_path, notice: 'Events imported'
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :date, :image, :tag)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
