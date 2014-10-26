class WelcomeController < ApplicationController

  def sizes; end

  def home
    @dresses = Dress.all
  end

  def contacts
    @banners = Banner.in_contacts
  end

end
