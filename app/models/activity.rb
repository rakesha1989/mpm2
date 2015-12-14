class Activity < ActiveRecord::Base

	has_many :assignments, dependent: :destroy

	validates_presence_of :name
	
end
