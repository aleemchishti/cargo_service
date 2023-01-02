class Traveler::DashboardsController < ApplicationController
	before_action :authenticate_user!
end
