class HomeController < ApplicationController
  def laundry
    @customer_reviews = CustomerReview.all
  end

end
