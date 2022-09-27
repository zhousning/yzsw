class HomeSetting < ActiveRecord::Base

  mount_uploader :logo, EnclosureUploader

  mount_uploader :avatar, EnclosureUploader

  mount_uploader :photo, EnclosureUploader




  has_many :enclosures, :dependent => :destroy
  accepts_nested_attributes_for :enclosures, reject_if: :all_blank, allow_destroy: true




end
