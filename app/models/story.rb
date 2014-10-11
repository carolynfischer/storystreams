class Story < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  acts_as_taggable_on :tags
end
