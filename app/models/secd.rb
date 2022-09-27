class Secd < ActiveRecord::Base

  mount_uploader :sidebar, EnclosureUploader

  mount_uploader :header, EnclosureUploader






  belongs_to :frst


  has_many :articles, :dependent => :destroy
  accepts_nested_attributes_for :articles, reject_if: :all_blank, allow_destroy: true



end
