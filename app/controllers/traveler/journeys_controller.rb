class Traveler::JourneysController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @q = Journey.ransack(params[:q])
    @journeys = @q.result(distinct: true)
    
    @journeys = @journeys.where(user_id: current_user.id)
  end

  def new
    if current_user.traveler?
      @journey = Journey.new
      @journey.user_id = current_user.id
    end 
  end

  def create 
    if current_user.traveler?
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
    @journey = Journey.find_by(id:params[:id])
  end 
  
  def edit
    if current_user.traveler?
     @journey = Journey.find_by(id:params[:id])
    end
  end 

  def update 
    if current_user.traveler?
      @journey = Journey.find_by(id:params[:id])
      if @journey.update(journey_params)
        redirect_to traveler_journey_path
      else
        render :edit
      end 
    end 
  end 

  def destroy
    if current_user.traveler?
      @journey = Journey.find_by(id:params[:id])
      @journey.destroy
      redirect_to traveler_journey_url
    end 
  end 

  def journey_list
    if current_user.sender?
      @journeys = Journey.all
      @q = Journey.ransack(params[:q])
      @journeys = @q.result(distinct:true)
    end
  end  

  private 

    def journey_params
      params.require(:journey).permit(:from, :to, :departure, :rate, :capacity)
    end
end