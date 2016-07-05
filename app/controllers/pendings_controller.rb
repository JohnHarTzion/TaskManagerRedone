class PendingsController < ApplicationController
	def index
		@pendings = Pending.where(status: 'pending')
		@progressings = Pending.where(status: 'in progress')
	end

	def new
		@pending = Pending.new
	end

	def create
		@pending = Pending.create(pending_params)
		if @pending.save
			redirect_to pendings_url, :notice => 'created'
		end
	end

	def show
		@pending = Pending.find(params[:id])
	end

	def destroy
		@pending = Pending.find_by(params[:id])
		@pending.destroy
		redirect_to pendings_url
	end

	def update
		@pending = Pending.find(params[:id])
		@pending.update(status: 'in progress')
		redirect_to pendings_url
	end
	def undo
		@pending = Pending.find_by(params[:id])
		@pending.update(status: 'pending')
		redirect_to pendings_url
	end

	private

	def pending_params
		params.require(:pending).permit( :task_name , :task_time_in_minutes , :status)
	end

	
end