class CataAttachment < ActiveRecord::Base
    mount_uploader :content, AvatarUploader
    belongs_to :catalog
end
