class Lead < ApplicationRecord
  require 'sendgrid-ruby'
  include SendGrid

  belongs_to :user, optional: true
  validates :full_name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :phone, presence: true, allow_blank: false
  validates :business_name, presence: true, allow_blank: false
  validates :project_name, presence: true, allow_blank: false
  validates :department, presence: true, allow_blank: false
  validates :project_description, presence: true, allow_blank: false
  validates :message, presence: true, allow_blank: false

  mount_uploader :attachment, AttachmentUploader

  #  after_create :rocketMail <- not working

  def rocketMail
    @full_name = "#{self.full_name}"
    @project_name = "#{self.project_name}"
    @email = "#{self.email}"
    mail = SendGrid::Mail.new
    mail.from = Email.new(email: 'olivier_beauchesne4@hotmail.com')
    mail.subject = 'Hello World from the Twilio SendGrid Ruby Library'
    pp mail
    personalization = Personalization.new
    personalization.add_to(SendGrid::Email.new(email: @email))
    personalization.add_dynamic_template_data(
      { 'full_name' => @full_name, 'project_name' => @project_name }
    )
    mail.add_personalization(personalization)
    mail.template_id = 'd-b3ae4b30c1e54327bd9460468cf77df3'
    mail.send_at = Email.new(email: 'jorgemarcoux@gmail.com')
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts 'alolooooooooooooooooooooooooooo'
  end

  def ticket_subject
    "#{self.full_name} from #{self.business_name}"
  end

  def ticket_body
    @attachment = self.attachment ? 'The Contact uploaded an attachment' : ''
    "
    The contact #{self.full_name} from company #{
      self.business_name
    } can be reached at email #{self.email} and at phone number #{
      self.phone
    }. <br>
    #{self.department} has a project named #{
      self.project_name
    } which would require contribution from Rocket Elevators.
    <br> 
    Project Description: #{self.project_description}
    <br>
    Attached Message: #{self.message}
    <br>
    #{@attachment}
    <br>
    <a href='#{ENV['WEBSITE_URL']}/backoffice/lead/#{
      self.id
    }'>Open in back office</a>"
  end
end
