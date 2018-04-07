class SkinCareController < ApplicationController
  
  def welcome
    @reviews = PReview.where("rating > 3.5").limit(5).sort_by(&:created_at)
  end
  
  def how_it_works
  end
  
  def eczema
  end
  
  def itchy_skin
  end
  
  def dry_skin
  end
  
  def bruises
  end
  
  def cradle_cap
  end
  
  def nucifera
  end
  
  def science
  end
  
end
