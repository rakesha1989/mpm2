class Role < ActiveRecord::Base

	has_many :permissions
	has_many :employees, through: :permissions

end
