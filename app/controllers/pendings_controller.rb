class PendingsController < ApplicationController
	def index
		@pendings = Pending.all
	end

	def new
		@pending = Pending.new
	end

	def create
		@pending = Pending.create(pending_params)
		redirect_to action:'show'

	end

	def show
		@pending = Pendings.find(params[:id])
	end

	private

	def pending_params
		params.require(:pending).permit(:task_name , :task_time_in_minutes , :status)
	end

	
end