class Company < ActiveRecord::Base

	has_many :meetings, dependent: :destroy
	has_many :users, dependent: :destroy

	validates_presence_of :name, :sector, :cin_no, :pan_no
	
end
