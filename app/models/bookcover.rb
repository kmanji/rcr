class Bookcover < ActiveRecord::Base
	
	belongs_to :user

	mount_uploader :cover, CoverUploader

	serialize :meta_tags
end
