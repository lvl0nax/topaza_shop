class Image < ActiveRecord::Base
  mount_uploader :name, ImageUploader
  default_scope { order('id') }
  belongs_to :dress
end