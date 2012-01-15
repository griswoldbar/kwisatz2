class PagesController < ApplicationController

  def home
    @title="Kwisatz"
  end

  def contact
    render :layout => false
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end
end