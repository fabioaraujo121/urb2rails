class KindStep < ApplicationRecord
  	belongs_to :user
  	belongs_to :kind
  	has_many :steps
  	has_many :kind_step_users
end
