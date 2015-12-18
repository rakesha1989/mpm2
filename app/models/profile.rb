class Profile < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :first_name, :last_name, :d_o_b, :designation, :gender, :email, :mobile
	
end
