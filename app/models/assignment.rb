class Assignment < ActiveRecord::Base


	has_many :plan_assignments
	has_many :plans, through: :plan_assignments
	belongs_to :category
	belongs_to :activity
	has_many :assignment_users
	has_many :users, through: :assignment_users

def details
	" #{name} - #{due_at} "
end


end
