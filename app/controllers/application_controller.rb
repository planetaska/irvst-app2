class ApplicationController < ActionController::Base
  include InertiaCsrf

  inertia_share auth: -> {
    if user_signed_in?
      {
        user: current_user.email
      }
    end
  }
end
