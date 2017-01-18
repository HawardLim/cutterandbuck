class Catalog < ActiveRecord::Base
    has_many :cata_attachments
    accepts_nested_attributes_for :cata_attachments
end
