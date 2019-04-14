module Students
    require 'securerandom'

    class SessionsController < ApplicationController
        before_action :authenticate_student!, only: [:destroy]

        def create
            #First find the student
            @student = Student.where(email: params[:email]).first
            #IF not exists or password is invalide return 401
            if !(@student&.valid_password?(params[:password]))  
                head(:unauthorized)
                return
            end
            #Put api_token if it null
            if !@student.api_token
                token=set_api_token
                @student.api_token=token
                @student.save
            end
            #Read api_token
            #Render if the student enter the found and entered the right password
            render json: @student 

        end

        def destroy
            current_student.api_token= nil
            current_student.save
            render json: {
                message: "You are logged out!"
            }, status: :ok
        end

        private
        def set_api_token
            SecureRandom.hex(24)
        end

        def serializer
            StudentSerializer
        end
    end
end