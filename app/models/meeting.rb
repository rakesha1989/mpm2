class Meeting < ActiveRecord::Base

	has_many :plans
	has_many :meeting_users
	has_many :users, through: :meeting_users
	belongs_to :company

def list
plan.where('meeting_id =?',id)
end

def list_name
plan.where('meeting_id =?',id).pluck(:name)
end

def show_plans
	@plan = Plan.where("start_date > ?", Date.today)
end

def self.details
	Plan.where("start_date > ?", Date.today)	
end

end
