class ClassGroup < ApplicationRecord
  belongs_to :user

  has_many :seating_charts, dependent: :destroy
  has_many :students, dependent: :destroy
end
