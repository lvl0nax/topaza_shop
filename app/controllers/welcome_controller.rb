class WelcomeController < ApplicationController
  def home
    @banner = Banner.first
  end
end
