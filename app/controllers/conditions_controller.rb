class ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
    @banners = Banner.in_conditions
  end
end