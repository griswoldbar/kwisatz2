class PagesController < ApplicationController
#testing 1.2.3
  def home
    @title="Kwisatz"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end
end