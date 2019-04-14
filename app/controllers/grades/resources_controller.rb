module Grades
    class ResourcesController < ApplicationController
        before_action :set_grade, only: [:show]

        # GET /grades
        def index
            @grades = Grade.all

            render json: @grades

            #without using fast_json_serialization
            # render_resources(@grades)
        end

        # GET /grades/1
        def show
            render json: @grade 
            #without using fast_json_serialization
            # render_resource(@grade)
        end

        # POST /grades
        def create
            @grade = Grade.new(grade_params)
            if @grade.save
                render json: @grade
            else
                render json: @grade.errors, status: :unprocessable_entity
            end
        end

        private

        def set_grade
          @grade = Grade.find(params[:id])
        end

        # Allowed params 
        def grade_params
            params.permit(:name, :description)
        end

        def serializer
            GradeSerializer
        end
    end
end