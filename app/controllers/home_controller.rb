class HomeController < ApplicationController
  def index
    @recent_housings = Housing.find(:all, order: "created_at", 
                                      limit: 5)
    @recent_furnitures = Furniture.find(:all, order: "created_at",
                                      limit: 5)
  end
end
