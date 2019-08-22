class Demand < ApplicationRecord
  	belongs_to :user
  	belongs_to :kind
  	has_many :owners
  	has_many :steps

  	enum status: [:opened, :processing, :stopped, :done]
end
