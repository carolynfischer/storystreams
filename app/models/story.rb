class Story < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_many :pictures
  has_many :captions
  belongs_to :user
  acts_as_taggable_on :tags

  def cover_picture
    Picture.find_by_id(self.cover_picture_id)
  end

  def cover_picture= picture
    self.cover_picture_id = picture.id
  end
end
