class Address < ApplicationRecord
  def custom_label_method
    "#{number_and_street}"
  end

  def full_address
    [number_and_street, city, state, country].compact.join(', ')
  end

  belongs_to :building, optional: true
  belongs_to :customer, optional: true
  geocoded_by :full_address
  before_save :geocode
end
