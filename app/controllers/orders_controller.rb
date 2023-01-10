class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :redirect_if_traveler, only: %i[new]

	def index
		if current_user.sender?
			@orders = current_user.s_orders 
		else
			@orders = current_user.t_orders
		end
	end

	def new
    if current_user.sender?
      @order = Order.new
    end 
	end

	def create 
	  if current_user.s_orders.create(order_params) 
			redirect_to orders_path
		else
			render :new 
		end  
	end 

	def show
		@order = Order.find_by(id: params[:id])
	end 
		
	def edit
		if current_user.sender?
			@order = Order.find_by(id: params[:id])
		end 
	end

	def update 
	 	if current_user.sender?
			@order = Order.find_by(id: params[:id])
			if @order.update(order_params)
				redirect_to orders_path
			else
				render :edit
			end 
	 	end 
	end	

	def destroy
		if current_user.sender?
			@order = Order.find_by(id: params[:id])
			@order.destroy
			redirect_to orders_url , :notice => "order has been deleted"
		end
	end

	def received_orders
		if current_user.traveler?
			@orders = current_user.t_orders
		end 
	end 

	private 

	def order_params
		params.require(:order).permit(:traveler_id, :from, :to, :weight, :sender_name, :receiver_name, :contact, :capacity)
	end

	def redirect_if_traveler
		if current_user.traveler?
			redirect_to root_path,notice:"not authorized"
		end 
	end 
end