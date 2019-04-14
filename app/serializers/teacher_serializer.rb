class TeacherSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :api_token, :created_at, :updated_at
  # set_type :movie  # optional

  has_many :courses, if: Proc.new { |record| record.courses.any? }
end
