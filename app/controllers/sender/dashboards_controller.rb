class Sender::DashboardsController < ApplicationController
	before_action :authenticate_user!
	before_action :only_senders

	def index
	end 

	def only_senders
    if current_user.role=='sender'
      sender_dashboards_path
    else
      root_path
    end 
  end 
end
