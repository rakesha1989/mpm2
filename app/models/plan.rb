class Plan < ActiveRecord::Base

	#Associations
	has_many :assignments, dependent: :destroy
	belongs_to :meeting
	belongs_to :priority
	belongs_to :status
	has_many :plan_categories
	has_many :categories, through: :plan_categories

	#validations
	validates_presence_of :name, :start_date, :status_id, :meeting_id, :priority_id, :rating
	validate :check_start_date
	validates_presence_of :start_date, message: "should be selected"
	validates_numericality_of :status_id
	validates_numericality_of :meeting_id
	validates_numericality_of :priority_id
	

def details
	"#{meeting.plan_month.strftime("%B %y")} - #{name} - #{start_date} - Rating #{rating}"
end

def list
	Assignment.where('plan_id =?',id)
end

def list_name
	Assignment.where('plan_id =?',id).pluck(:name)
end

def self.completed_assignments
	Assignment.where("is_completed = ?", true)

end

def self.assigned_assignments
	Assignment.where("is_completed = ? AND due_at >= ?", false,Date.today)

end

def self.pending_assignments(date)
	Assignment.where("due_at < ? AND is_completed = ?", date,false)
end
		private


 def check_start_date
if !self.start_date.nil? && self.start_date < Date.today
	errors.add(:start_date, "Date is invalid. Should not be less than #{Date.today}")
 end
end

end

