class Story < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_many :pictures
  has_many :captions
  acts_as_taggable_on :tags
end
