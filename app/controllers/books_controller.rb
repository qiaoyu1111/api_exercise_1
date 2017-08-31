class BooksController < ApplicationController
  def index
    @cities = City.all
  end
end
