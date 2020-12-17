require 'rubygems'
require 'excon'
require 'json'

module InterventionsHelper
  def intervention_zd_ticket(data)
    begin
      employee = Employee.find(data.employee_id)
    rescue => exception
      puts exception
    end
    begin
      customer = Customer.find(data.customer_id)
    rescue => exception
      puts exception
    end
    begin
      user = User.find(data.author_id)
    rescue => exception
      puts exception
    end

    building = data.building_id ? "Building: #{data.building_id} <br>" : ''
    battery = data.battery_id ? "Battery: #{data.battery_id} <br>" : ''
    column = data.column_id ? "Column: #{data.column_id} <br>" : ''
    elevator = data.elevator_id ? "Elevator: #{data.elevator_id} <br>" : ''
    description = data.report ? "Issue report: #{data.report}" : ''

    puts employee
    @request_body = {
      "ticket": {
        "subject":
          "New Intervention Created #{
            employee ? 'By ' + employee.custom_label_method : ''
          }",
        "type": 'problem',
        "priority": '',
        "comment": {
          "html_body":
            "Company #{customer.company_name} requires an intervention. <br> #{
              building
            }#{battery}#{column}#{elevator}#{description}"
        },
        "requester": {
          "name": "#{employee ? employee.custom_label_method : 'N/A'}",
          "email": "#{user ? user.email : 'no@email.provided'}"
        }
      }
    }

    begin
      connection =
        Excon.new(
          "#{ENV['ZD_URL']}/api/v2/tickets.json",
          debug_request: true, debug_response: true
        )
      connection.request(
        # interval is in seconds, this will block the client so leaving the limit and interval low
        method: 'POST',
        idempotent: true,
        expects: [200, 201],
        retry_limit: 2,
        retry_interval: 0.5,
        body: JSON.generate(@request_body),
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Basic #{ENV['ZD_AUTH']}"
        },
        instrumentor: ActiveSupport::Notifications
      ) # ActiveSupport::Notifications is for logging of requests and responses
    rescue Excon::Error => e
      puts "
      Warning: id # #{
             data.id
           } could not be sent to Zendesk. Please notify an administrator.
           Error: #{e}
           "
    end
  end
end
