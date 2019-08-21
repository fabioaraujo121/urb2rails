class Step < ApplicationRecord
  	belongs_to :kind_step
  	belongs_to :demand
  	belongs_to :user
end
