class WelcomeController < ApplicationController
  def index
    p "index hit "
    # First.perform_async("Jerry", 5)
    unless Rails.application.config.x.accounting_invoice_omit_orderer_name.present?
      p "im doing something"
    end
    p "i will always do this"
  end
end