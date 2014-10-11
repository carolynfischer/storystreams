class Picture < ActiveRecord::Base
  mount_uploader :filename, PictureUploader
  belongs_to :story
end
