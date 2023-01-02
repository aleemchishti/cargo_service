class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :redirect_if_traveler, only: %i[new]
	def index
		@orders = Order.all
	end

	def new
		if current_user.role=='sender'
			@order = Order.new
		end 
	end
	def create 
		if current_user.role=='sender'
			@order = Order.new(order_params)
			@order.user_id = current_user.id
			if @order.save 
				redirect_to orders_path
			else
				render :new 
				flash.alert = "User not found."
			end 
		end 
	end

	def show
		@order = Order.find(params[:id])
	end 
	
	def edit
		if current_user.role=='sender'
			@order = Order.find(params[:id])
		end 
	end
	def update 
		if current_user.role=='sender'
			@order = Order.find(params[:id])
			if @order.update(order_params)
				redirect_to orders_path
			else
				render :edit
			end 
		end 
	end	

	def destroy
		if current_user.role=='sender'
			@order = Order.find(params[:id])
			@order.destroy
			redirect_to orders_url , :notice => "order has been deleted"
		end
	end 

	private 
		def order_params
			params.require(:order).permit(:sender_name, :receiver_name, :destination, :contact, :weight)
		end
		def redirect_if_traveler
			if current_user.role=='traveler'
				redirect_to root_path,notice:"not authorized"
			end 

		end 
end