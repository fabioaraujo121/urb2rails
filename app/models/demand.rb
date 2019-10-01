class Demand < ApplicationRecord
  	belongs_to :user
  	belongs_to :kind
  	has_many :owners
  	has_many :steps

  	enum status: [:opened, :processing, :stopped, :done]

  	after_validation :set_protocol, on: :create

  	private
  		def set_protocol
  			year = DateTime.current.year
  			n = Demand.where("EXTRACT(YEAR FROM demands.created_at) = ?", year).length + 1
  			self.protocol = "#{n}/#{year}"
  		end
end
