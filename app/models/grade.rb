class Grade < ApplicationRecord
    #scopes
    #associations
    has_many :courses
    has_many :students
    #validations
    validates :name, presence: true
    validates :description, presence: true
    #callbacks
end
