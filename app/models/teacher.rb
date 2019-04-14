class Teacher < ApplicationRecord
  
  CSV_ATTRIBUTES = %w(id email)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    #scopes
    #associations
    has_many :courses
    #validations
    #callbacks
end
