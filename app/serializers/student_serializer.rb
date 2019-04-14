class StudentSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :api_token, :created_at, :updated_at
  # set_type :movie  # optional

  belongs_to :grade
end
