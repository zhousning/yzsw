class HomeContent < ActiveRecord::Base

  mount_uploader :by1, EnclosureUploader

  mount_uploader :by2, EnclosureUploader

  mount_uploader :by3, EnclosureUploader

  mount_uploader :by4, EnclosureUploader

  mount_uploader :by5, EnclosureUploader

  mount_uploader :by6, EnclosureUploader



  mount_uploader :video, AttachmentUploader


  has_many :enclosures, :dependent => :destroy
  accepts_nested_attributes_for :enclosures, reject_if: :all_blank, allow_destroy: true


  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true



end
