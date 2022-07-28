class WelcomeController < ApplicationController
  def index
    First.perform_async("Jerry", 5)
end