class Customer < ApplicationRecord
  has_many :buildings
  has_one :address, dependent: :delete
  belongs_to :user, optional: true

  #  after_commit :dropbox_API

  def custom_label_method
    "#{User.find(user_id).first_name} #{User.find(user_id).last_name}"
  rescue => e
    puts e
  end

  def dropbox_API
    client = DropboxApi::Client.new(DROPBOX_OAUTH_BEARER)
    Lead.all.each do |lead|
      if lead.attachment != nil
        if self.user_id == lead.user_id
          folder_name = '/' + self.company_name.to_s
          begin
            client.create_folder folder_name
          rescue StandardError => e
            print e
          end

          file_content = lead.attachment.read
          file_extension = File.extname(lead.attachment.to_s)
          file_name = folder_name + '/' + lead.id.to_s + file_extension
          #puts file_name
          client.upload file_name, file_content
          lead.attachment = nil
          lead.save
        end
      end
    end
  end
end
