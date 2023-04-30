class StaticController < ApplicationController
  def home
    render inertia: 'App'
  end
end