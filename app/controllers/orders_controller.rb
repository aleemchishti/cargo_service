class OrdersController < ApplicationController
	before_action :authenticate_user!
	def index
		@orders = Order.all
	end

	def new
		if current_user.role=='sender'
			@order = Order.new
		end 
	end
	def create 
		@order = Order.new(order_params)
		if @order.save 
			redirect_to admin_orders_path
		else
			render :new
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
				redirect_to admin_orders_path
			else
				render :edit
			end 
		end 
	end	

	def destroy
		if current_user.role=='sender'
			@order = Order.find(params[:id])
			@order.destroy
			redirect_to admin_orders_url , :notice => "order has been deleted"
		end
	end 

	private 

		def order_params
			params.require(:order).permit(:sender_name, :receiver_name, :destination, :contact, :weight)
		end
end