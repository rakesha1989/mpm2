class Meeting < ActiveRecord::Base

	has_many :plans, dependent: :destroy
	has_many :meeting_users
	has_many :users, through: :meeting_users
	belongs_to :company
	validates_presence_of :plan_month, :date, :category, :company_id


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

def formatted_date
	"#{plan_month.strftime("%B %Y")}"
end	

end
