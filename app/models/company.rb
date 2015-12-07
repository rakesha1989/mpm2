class Company < ActiveRecord::Base

	has_many :meetings
	has_many :users
	
end
