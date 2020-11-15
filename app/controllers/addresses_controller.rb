class AddressesController < ApplicationController
  before_action :authenticate_user!
  def index
    building_info = []
    Building.all.each do |building|
      customer_record = Customer.find(building.customer_id)
      address_record = Address.find(building.address_id)
      customer_name = customer_record.custom_label_method
      full_address = address_record.full_address
      tech_contact = building.technical_contact_full_name
      column_number = 0
      elevator_number = 0
      floor_number = 0
      building_batteries = Battery.where(building_id: building.id)
      battery_number = building_batteries.count
      building_batteries.each do |b|
        columns = Column.where(battery_id: b.id)
        column_number += columns.count
        columns.each do |c|
          elevators = Elevator.where(column_id: c.id)
          elevator_number += elevators.count
          floor_number += c.number_of_floors_served
        end
      end

      building_info.push(
        {
          'Address' => full_address,
          'Floors' => floor_number,
          'Customer' => customer_name,
          'Batteries' => battery_number,
          'Columns' => column_number,
          'Elevators' => elevator_number,
          'Name of Technical Contact' => tech_contact,
          'lat' => address_record.latitude,
          'lng' => address_record.longitude
        }
      )
    end
    @addresses = building_info.to_json
  end
end
