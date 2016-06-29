class PendingsController < ApplicationController
	def index
		@pendings = Pending.all
	end

	def new
		@pending = Pending.new
	end

	def create
		@pending = Pending.create(pending_params)
		if @pending.save
			redirect_to root_url, :notice => 'created'
		end
	end

	def show
		@pending = Pending.find(params[:id])
	end

	def destroy
		@pending = Pending.find(params[:id])
		@pending.destroy
		redirect_to 
	end

	private

	def pending_params
		params.require(:pending).permit( :task_name , :task_time_in_minutes , :status)
	end

	
end