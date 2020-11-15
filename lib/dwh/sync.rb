module Dwh
  class Sync
    def self.sync_fact_quotes
      Quote.all.each do |q|
        user = User.find(q.user_id) # gets the customer from the quote to find it's company name
        customer = Customer.find(user.id)

        FactQuote.create!(
          {
            quote_id: q.id,
            quote_created_at: q.created_at,
            company_name: customer.company_name,
            email: user.email,
            elevator_number: q.elevator_number
          }
        )
      end
      # gets the user from the quote in order to find the email associated with it
    end

    def self.sync_dim_customers
      Customer.all.each do |c|
        elevator_number = 0
        customer_buildings = Building.where(customer_id: c.id).to_a
        customer_buildings.each do |building|
          batteries = Battery.where(building_id: building.id).to_a
          batteries.each do |battery|
            columns = Column.where(battery_id: battery.id).to_a
            columns.each do |column|
              elevators = Elevator.where(column_id: column.id).to_a
              elevator_number += elevators.size
            end
          end
        end
        city = Address.find(c.address_id).city

        DimCustomer.create!(
          {
            customer_creation_date: c.created_at,
            company_name: c.company_name,
            company_contact_full_name: c.company_contact_full_name,
            company_contact_email: c.company_contact_email,
            elevator_number: elevator_number,
            customer_city: city
          }
        )
      end
      # variable that counts the total number of elevator for the customer

      # goes through all the batteries linked to the building to eventually reach every elevator in every column and adds them to the elevator_number variable
    end

    def self.sync_fact_elevators
      Elevator.all.each do |e|
        column = Column.find(e.column_id)
        battery = Battery.find(column.battery_id)
        building = Building.find(battery.building_id)
        address = Address.find(building.address_id)
        customer = Customer.find(building.customer_id)

        FactElevator.create!(
          {
            serial_number: e.serial_number,
            date_of_commissioning: e.date_of_commissioning,
            building_id: building.id,
            customer_id: customer.id,
            building_city: address.city
          }
        )
      end
      # drilling down all the way to the address and customer table to get the relevant info for each elevator
    end

    def self.sync_fact_contacts
      User.all.each do |u|
        customer = Customer.find(u.id)
        lead = Lead.find(u.id)

        FactContact.create!(
          {
            contact_id: u.id,
            creation_date: u.created_at,
            company_name: customer.company_name,
            email: u.email,
            project_name: lead.project_name
          }
        )
      end
    end
  

  def self.sync_fact_interventions
    Elevator.all.each do |e| 
        col = Column.find(e.column_id)
        btry = Battery.find(col.battery_id)
        buil = Building.find(btry.building_id)
        empl = Employee.find(buil.technical_contact_id)
        intervention_start = Faker::Time.between_dates(from:'2017-01-01 07:03:30 -0700', to: Date.today, period: :all)
        
        def self.rng(id)
          return rand(0..1) == 0 ? id : nil
        end

      FactIntervention.create!(
        {
          employee_id: empl.id ,
          building_id: buil.id,
          battery_id: rng(btry.id),
          column_id: rng(col.id),
          elevator_id: e.id,
          result: ["Success","Failure","Incomplete"].sample,
          report: Faker::Lorem.sentence(word_count: rand(8..20).floor),
          status: ["Pending","InProgress","Interrupted","Resumed","Complete"].sample,
          intervention_start_date_time: intervention_start,
          intervention_end_date_time: intervention_start.next_day,
        }
      )
    end
  end

end
end
