class Step < ApplicationRecord
  	belongs_to :kind_step
  	belongs_to :demand
  	belongs_to :user

  	after_save do
  		# Set process to processing
  		self.demand.processing! if self.kind_step.valid_time and (self.demand.opened? or self.demand.stopped?)
  		# Stop the proccess if it's not a valid time
  		self.demand.stopped! unless self.kind_step.valid_time
  		# Update the current step of the demand
  		self.demand.update(current_kind_step_id: self.kind_step.id)
  	end
end
