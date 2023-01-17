class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :redirect_if_traveler, only: %i[new]
	before_action :set_order, only: %i[ show edit update destroy update_status ]

	def index
		@orders = current_user.sender? ? current_user.s_orders : current_user.t_orders
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

	def show; end 
		
	def edit
	end 

	def update 
		# debugger
	 	if current_user.sender?
			if @order.update(order_params)
				redirect_to orders_path
			else
				render :edit
			end 
	 	end 
	end	

	def destroy
		if current_user.sender?
			@order.destroy
			redirect_to orders_url , alert:  "order has been deleted"
		end
	end

	def received_orders
		if current_user.traveler?
			@orders = current_user.t_orders
		end 
	end

	def update_status
		if current_user.traveler?
			@order.update(status: 'Confirmed')
			redirect_to received_orders_path
		else
			redirect_to root_path
		end
	end

	private 

	def set_order
    @order = Order.find(params[:id])
  end
	
	def order_params
		params.require(:order).permit(:traveler_id, :from, :to, :weight, :sender_name, :receiver_name, :contact, :capacity, line_items_attributes: [:id, :item, :_destroy])
	end

	def redirect_if_traveler
		if current_user.traveler?
			redirect_to root_path, alert:"not authorized"
		end 
	end 
end