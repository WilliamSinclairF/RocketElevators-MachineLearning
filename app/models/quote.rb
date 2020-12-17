class Quote < ApplicationRecord
  belongs_to :user, optional: true

  def ticket_subject
    "Quote Requested From #{self.full_name}"
  end

  def ticket_body
    "#{self.full_name} just requested a quote. He may be reached by phone at #{
      self.phone
    } or by email at #{self.email}.<br>
    The quote is for a total of #{self.elevator_number} elevators with the #{
      self.product_line
    } product line and the quoted cost was $#{self.total_price}<br>
    <a href='#{ENV['WEBSITE_URL']}/backoffice/quote/#{
      self.id
    }'>Open quote in back office</a>
    "
  end
end
