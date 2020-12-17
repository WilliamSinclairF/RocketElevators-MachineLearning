class AudioFile < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
end
