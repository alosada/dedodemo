class CountriesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @countries = Country.all
    data = {model: "Country",
            has_many: "states",
            model_attr: "name",
            child_attr: "name"}
    @menu = DeDoDrop.new(data).menu
  end

end