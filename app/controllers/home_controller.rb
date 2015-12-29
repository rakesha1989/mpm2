class HomeController < ApplicationController

	before_filter :authenticate_user!

  def index
  	@meetings=Meeting.all
  	@categories=Category.all
  	@plan=Plan.all
  end
end
