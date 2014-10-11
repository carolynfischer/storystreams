class Story < ActiveRecord::Base
  #mount_uploader :picture, PictureUploader
  has_many :pictures
  acts_as_taggable_on :tags
end
