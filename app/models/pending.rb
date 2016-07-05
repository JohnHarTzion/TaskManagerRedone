class Pending < ActiveRecord::Base
	def presisted?
		!(new_record? || destroyed?)
	end
end
