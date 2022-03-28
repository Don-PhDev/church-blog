class ApplicationController < ActionController::Base
  def routing_error
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
