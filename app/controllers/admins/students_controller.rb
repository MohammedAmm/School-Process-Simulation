module Admins
    class StudentsController < ApplicationController 
        before_action :set_student, only: [:update]
        before_action :authenticate_admin!, only: [:update]
    
        # PUT/PATCH /admins/1
        def update
            if @student.update(modified_params)
                render json: @student
            else
                render json: @student.errors, status: :unprocessable_entity
            end
        end

        private
        
        def set_student
            @student = Student.find(params[:id])
        end

        def modified_params
            params.permit(:grade_id)
        end


        def serializer
            AdminSerializer
        end
    end
end
