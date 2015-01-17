require 'file_size_validator'

class Furniture < ActiveRecord::Base
  mount_uploader :picture1, PictureUploader
  mount_uploader :picture2, PictureUploader
  mount_uploader :picture3, PictureUploader
  mount_uploader :picture4, PictureUploader

  # validates :picture1, :picture2, :picture3, :picture4,
  #           presence: true,
  #           file_size: {
  #               maximum: 5.megabytes.to_i
  #           }

end
