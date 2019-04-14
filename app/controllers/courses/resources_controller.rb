module Courses
    class ResourcesController < ApplicationController
        before_action :set_course, only: [:show, :update]
        before_action :authenticate_admin!, only: [:create, :update, :destroy]

        # GET /courses
        def index
            @courses = Course.all

            render json: @courses 

            #without using fast_json_serialization
            # render_resources(@courses)
        end

        # GET /courses/1
        def show
            render json: @course 
            
            #without using fast_json_serialization
            # render_resource(@course)
        end

        # POST /courses
        def create
            @course = Course.new(course_params)
            if @course.save
                render json: @course
            else
                render json: @course.errors, status: :unprocessable_entity
            end
        end

        # PUT/PATCH /courses/1
        def update
            if @course.update(course_params)
                render json: @course
            else
                render json: @course.errors, status: :unprocessable_entity
            end
        end

        private

        def set_course
            @course = Course.find(params[:id])
        end

        # Allowed params 
        def course_params
            params.permit(:name, :description, :teacher_id, :grade_id)
        end

        def serializer
            CourseSerializer
        end
    end
end