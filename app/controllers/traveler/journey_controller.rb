class Traveler::JourneyController < ApplicationController
  before_action :authenticate_user!
	before_action :set_journey, only: %i[ show edit update destroy ]

  def index
    @journeys = Journey.all
  end
  
  def show
  end

  def new
    @journey = Journey.new
  end

  def edit
  end

  def create
    if current_user.role=='traveler'
      @journey = Journey.new(journey_params)
    end 
    respond_to do |format|
      if @journey.save
        format.html { redirect_to traveler_journey_url(@journey), notice: "journey was successfully created." }
        format.json { render :show, status: :created, location: @journey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if current_user.role == 'traveler'
      respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to traveler_journey_url(@journey), notice: "journey was successfully updated." }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end 
    end
  end

  def destroy
    if current_user.role=='traveler'
      @journey.destroy
    end 

    respond_to do |format|
      format.html { redirect_to traveler_journey_index_path, notice: "journey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_journey
      if current_user.role=='traveler'
        @journey = Journey.find(params[:id])
      end 
    end

    def journey_params
      params.require(:journey).permit(:to,:from,:departure,:capacity,:rate)
    end
end
