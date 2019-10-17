class Demand < ApplicationRecord
  	belongs_to :user
  	belongs_to :kind
  	has_many :owners
  	has_many :steps
    belongs_to :current_kind_step, foreign_key: "current_kind_step_id", class_name: "KindStep", optional: true

  	enum status: [:opened, :processing, :stopped, :done, :archieved]

  	after_validation :set_protocol, on: :create

  	private
  		def set_protocol
  			year = DateTime.current.year
  			n = Demand.where("EXTRACT(YEAR FROM demands.created_at) = ?", year).length + 1
  			self.protocol = "#{n}/#{year}"
  		end
end
