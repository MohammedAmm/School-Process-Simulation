require "csv"

class Student < ApplicationRecord

  CSV_ATTRIBUTES = %w(id email created_at)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    #scopes
    #associations
    belongs_to :grade
    #validations
    #callbacks  
    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << CSV_ATTRIBUTES
        all.each do |student|
          csv << student.attributes.values_at(*CSV_ATTRIBUTES)
        end
      end
    end
 

end
