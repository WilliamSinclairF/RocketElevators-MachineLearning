require 'slack-notifier'

def elevatorStatusChange

  notifier = Slack::Notifier.new Rails.application.credentials.slack[:token]
  notifier.ping "The Elevator [Elevator’s ID] with Serial Number [Serial Number] changed status from [Old Status] to [New Status]
"
end