class HomeController < ApplicationController
  def index  	
  	@favores = Favor.all.order(:created_at)
  end
end
