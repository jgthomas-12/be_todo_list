class Task < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :completed, inclusion: { in: [true, false] }
  
end
