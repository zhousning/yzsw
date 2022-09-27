class Frst < ActiveRecord::Base

  mount_uploader :sidebar, EnclosureUploader

  mount_uploader :header, EnclosureUploader






  has_many :secds, :dependent => :destroy
  accepts_nested_attributes_for :secds, reject_if: :all_blank, allow_destroy: true



end
