class Intervention < ApplicationRecord
  enum result: %i[incomplete failure in_progress complete]
  enum status: %i[pending escalated resolved]
end
