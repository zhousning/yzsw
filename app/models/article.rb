require 'nokogiri'

class Article < ActiveRecord::Base





  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true


  belongs_to :secd


  before_save :raw_ctn_update

  def raw_ctn_update
    doc = Nokogiri::HTML(self.content)
    ctn = doc.text
    ctn.gsub!(/&nbsp;/i, "")
    ctn.gsub!(/\s/, "")
    ctn.gsub!(/\/\//, "")
    ctn.gsub!("点击蓝字关注我们", "")
    self.raw_content = ctn
  end

end
