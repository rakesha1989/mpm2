class Category < ActiveRecord::Base


has_many :plan_categories
has_many :plans, through: :plan_categories
has_many :assignments

end
