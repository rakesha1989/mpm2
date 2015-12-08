class PlanAssignment < ActiveRecord::Base

	belongs_to :plan
	belongs_to :assignment
end
