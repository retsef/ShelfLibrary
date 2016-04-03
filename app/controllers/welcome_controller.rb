class WelcomeController < ApplicationController

  def index
    @books = Book.first(50)
  end

end