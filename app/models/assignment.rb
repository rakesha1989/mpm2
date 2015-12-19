class Assignment < ActiveRecord::Base

	belongs_to :plan
	belongs_to :category
	belongs_to :activity
	has_many :assignment_users
	has_many :users, through: :assignment_users
	validates_presence_of :name, :due_at, :activity_id, :category_id
	validate :check_due_at



def details
	" Activity-#{activity.name}-#{name} - #{due_at.strftime("%b %Y %R %p")} "
end


	private

	def check_due_at
    if !self.due_at.nil? && self.due_at < plan.start_date
  errors.add(:due_at, "Invalid, should not be less than #{plan.start_date}")
	end
end

end
