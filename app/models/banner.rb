class Banner < ActiveRecord::Base
  validates_presence_of :title, :positions, :url, :button_name
  serialize :positions, Array

  scope :in_main, ->{where('positions like ?', '%welcome#home%')}
  scope :in_conditions, ->{where('positions like ?', '%conditions#index%')}
  scope :in_contacts, ->{where('positions like ?', '%welcome#contacts%')}
  scope :in_dresses, ->{where('positions like ?', '%dresses#index%')}
  scope :in_thanks, ->{where('positions like ?', '%orders#thanks%')}
end