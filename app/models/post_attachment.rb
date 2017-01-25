class PostAttachment < ActiveRecord::Base
   # mount_uploader :avatar, CutterUploader
   belongs_to :post
end
