ActiveSupport::Notifications.subscribe('excon.request') do |*_, payload|
  Rails.logger.info(
    "
    
    API Request:
    
    #{payload[:method]} #{payload[:path]}"
  )
  Rails.logger.info(
    "headers: #{payload[:headers].except('Content-Type', 'Host')}"
  )
  Rails.logger.info("query: #{payload[:query]}") if payload[:query].present?
  Rails.logger.info("body: #{payload[:body]}") if payload[:body].present?
end

ActiveSupport::Notifications.subscribe('excon.response') do |*_, payload|
  Rails.logger.info(
    "
    
    API Response: 

    
    #{payload[:body]}"
  )
end
