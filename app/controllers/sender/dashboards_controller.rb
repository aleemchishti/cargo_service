class Sender::DashboardsController < ApplicationController
	before_action :authenticate_user!
	
	def index; end

	# def only_senders
  #   if current_user.sender?
  #     sender_dashboards_path
  #   else
  #     root_path
  #   end 
  # end 
end
