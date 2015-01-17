require 'file_size_validator'

class Furniture < ActiveRecord::Base
  # mount_uploader :picture1, PictureUploader
  # mount_uploader :picture2, PictureUploader
  # mount_uploader :picture3, PictureUploader
  # mount_uploader :picture4, PictureUploader

  belongs_to :user
end
