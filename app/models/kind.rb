class Kind < ApplicationRecord
  	belongs_to :user
  	has_many :demands
  	has_many :kind_steps
end
