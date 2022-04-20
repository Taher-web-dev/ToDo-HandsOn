class Task < ApplicationRecord
  validates :description, presence: true
  validates :day, presence: true
end
