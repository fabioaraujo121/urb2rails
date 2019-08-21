class Demand < ApplicationRecord
  	belongs_to :user
  	has_many :owners
  	has_many :steps
end
