require 'slack-notifier'
require 'twilio-ruby'

class Elevator < ApplicationRecord
  belongs_to :column
  before_update :messageSms
  before_update :slack_notifier_messsage


def slack_notifier_messsage
   if self.elevator_status_changed? 
    notifier = Slack::Notifier.new ENV["SLACK_TOKEN"]
    notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.elevator_status_was} to #{self.elevator_status}"
   end 
end

def messageSms
  if self.elevator_status_changed? 
    if self.elevator_status == "Intervention"
      puts "-------allo"
      message = "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.elevator_status_was} to #{self.elevator_status}"
  
      account_sid = ENV["twilio_sid"]
      auth_token = ENV["twilio_token"]
      client = Twilio::REST::Client.new(account_sid, auth_token)
  
      from = ENV["twilio_from_numbr"]
      to = ENV["twilio_to_numbr"]
  
      client.messages.create(
      from: from,
      to: to,
      body: message
      )
    end
    puts  "allo-----------"
  end
end
end




