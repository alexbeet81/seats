class SeatingChartSerializer
  include JSONAPI::Serializer
  attributes :number_of_students, :rows, :columns, :class_group_id
  
  belongs_to :class_group
end
