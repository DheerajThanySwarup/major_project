class Pin < ActiveRecord::Base
	belongs_to :user
	mount_uploader :attachment, AttachmentUploader
	validates :user, presence: true

	def self.search(search)
	  where("tag LIKE ?", "%#{search}%")
	end

end
