class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :article
  belongs_to :home_content
end





# == Schema Information
#
# Table name: attachments
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  file       :string          default(""), not null
#

