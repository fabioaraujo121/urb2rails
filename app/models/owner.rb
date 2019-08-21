class Owner < ApplicationRecord
  	belongs_to :citizen
  	belongs_to :demand
  	belongs_to :user
end
