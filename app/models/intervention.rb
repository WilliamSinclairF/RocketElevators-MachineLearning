class Intervention < ApplicationRecord
  enum result: %w[Incomplete Failure Complete]
  enum status: ['Pending', 'In Progress', 'Complete']
end
