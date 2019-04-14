class CourseSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
  belongs_to :teacher
  belongs_to :grade
end
