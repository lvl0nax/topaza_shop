module Banners
  extend ActiveSupport::Concern
  def set_banners
    @banners = Banner.all.select { |m| m.positions.include? "#{controller_name}##{action_name}" }
  end
end