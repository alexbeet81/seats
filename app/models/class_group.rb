class ClassGroup < ApplicationRecord
  belongs_to :user

  has_many :seating_charts, dependant: :destroy
  has_many :students, dependant: :destroy
end
