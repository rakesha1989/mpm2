class PlanCategory < ActiveRecord::Base

	
	belongs_to :plan
	belongs_to :category
	
end
