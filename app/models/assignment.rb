class Assignment < ActiveRecord::Base


	belongs_to :plan
	belongs_to :category
	belongs_to :activity
	has_many :assignment_users
	has_many :users, through: :assignment_users


end
