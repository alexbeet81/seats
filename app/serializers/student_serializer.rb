class StudentSerializer
  include JSONAPI::Serializer
  attributes :chinese_name, :english_name, :number, :participation, :score, :class_group_id

  belongs_to :class_group
end
