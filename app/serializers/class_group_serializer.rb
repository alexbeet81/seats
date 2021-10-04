class ClassGroupSerializer
  include JSONAPI::Serializer
  attributes :name, :user_id, :slug

  has_many :seating_charts
  has_many :students
end
