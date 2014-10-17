class Banner < ActiveRecord::Base
  validates_presence_of :title, :positions, :url, :button_name

  serialize :positions, Array
end