class Question < ActiveRecord::Base




  has_many :enclosures, :dependent => :destroy
  accepts_nested_attributes_for :enclosures, reject_if: :all_blank, allow_destroy: true



  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true



end
