class Traveler::JourneysController < ApplicationController
  
  before_action :authenticate_user!
  before_action :authorized_traveler, except: [:journey_list]
  before_action :get_journey, except: [:new, :index, :create]

  def index

    @q = Journey.ransack(params[:q])
    @journeys = @q.result(distinct: true)
    @journeys = @journeys.where(user_id: current_user.id)
  end

  def new
    @journey = Journey.new
  end

  def create 
    @journey = Journey.new(journey_params)
    @journey.user_id = current_user.id
    if @journey.save!
      redirect_to traveler_journeys_path, alert: 'You have successfuly created a journey'
    else
      render :new
    end
  end

  def show; end 
  
  def edit; end 

  def update 
    if @journey.update(journey_params)
      redirect_to traveler_journeys_path, alert:'You have updated the journey details'
    else
      render :edit
    end 
  end 

  def destroy
    @journey.destroy
    redirect_to traveler_journeys_path, alert:'Journey deletion successfull'
  end 

  def journey_list
    return redirect_to root_path unless current_user.sender?

    @q = Journey.ransack(params[:q])
    @journeys = @q.result(distinct:true)
  end  

  private 

  def authorized_traveler
    redirect_to root_path unless current_user.traveler?
  end

  def get_journey
    @journey = Journey.find_by(id: params[:id])
  end

  def journey_params
    params.require(:journey).permit(:from, :to, :departure, :rate, :capacity)
  end
end