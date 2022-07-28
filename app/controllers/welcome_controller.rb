class WelcomeController < ApplicationController
  def index
    p "index hit "
    First.perform_async("Jerry", 5)
  end
end