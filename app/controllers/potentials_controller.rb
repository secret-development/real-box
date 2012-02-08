# encoding: UTF-8
class PotentialsController < ApplicationController
  respond_to :html;
  
  def index
    @potentials = Customer.potentials.all
    @title = "Потенциальные клиенты"
  end
end
