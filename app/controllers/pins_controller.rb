class PinsController < ApplicationController
	before_action :find_pin, only: [:edit, :update, :destroy]
	before_action :authenticate_user!
	
	def index
		@pins = Pin.all
		if params[:search]
			@pins = Pin.search(params[:search]).order("created_at DESC")
		else
			@pins = Pin.all.order('created_at DESC')
		end
	end

	def new
		@pin = current_user.pins.build
	end

	def edit

	end

	def mypins
		@pins = Pin.all.order("created_at DESC")
	end

	def show
		@pins = Pin.all.order("created_at DESC")
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Successfully Updated!!!!!"
		else
			render "edit"
		end
	end

	def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			redirect_to @pin, notice: "Successfully New Pin Created"
		else
			render "new"
		end
	end

	def destroy
		@pin.destroy
		redirect_to pins_index_path
	end

	private

	def pin_params
		params.require(:pin).permit(:tag, :description, :attachment)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end
end
