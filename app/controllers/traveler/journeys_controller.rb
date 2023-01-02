class Traveler::JourneysController < ApplicationController
  before_action :authenticate_user!
  before_action :only_for_travelers

  def index
    @journeys = Journey.all
  end

  def new
    if current_user.role=='traveler'
      @journey = Journey.new
      @journey.user_id = current_user.id
    end 
  end

  def create 
    if current_user.role=='traveler'
      @journey = Journey.new(journey_params)
      @journey.user_id = current_user.id
      if @journey.save 
        redirect_to traveler_journey_url(@journey)
      else
        render :new
      end 
    end 
  end

  def show
    @journey = Journey.find(params[:id])
  end 
  
  def edit
    @journey = Journey.find(params[:id])
  end

  def update 
    if current_user.role=='traveler'
      @journey = Journey.find(params[:id])
      if @journey.update(journey_params)
        redirect_to traveler_journey_path
      else
        render :edit
      end 
    end 
  end 

  def destroy
    if current_user.role=='traveler'
      @journey = Journey.find(params[:id])
      @journey.destroy
      redirect_to traveler_journey_url
    end 
  end 

  private 

    def journey_params
      params.require(:journey).permit(:from, :to, :departure, :rate, :capacity)
    end

    def only_for_travelers
      if current_user.role=='traveler'
        traveler_dashboards_path
      end 
    end 
end