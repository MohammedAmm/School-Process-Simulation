class Course < ApplicationRecord

  #associations
  belongs_to :teacher
  belongs_to :grade

  #validations
  validates :name, presence: true
  validates :description, presence: true
  validates_presence_of :teacher # will validate existance of object
  validates_presence_of :grade

  #scopes
  #callbacks

end
