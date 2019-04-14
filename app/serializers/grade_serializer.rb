class GradeSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description

  has_many :courses
  has_many :students
  
end
