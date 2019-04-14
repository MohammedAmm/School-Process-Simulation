module Teachers
    require 'securerandom'

    class SessionsController < ApplicationController
        before_action :authenticate_teacher!, only: [:destroy]

        def create
            #First find the teacher
            @teacher = Teacher.where(email: params[:email]).first
            #IF not exists or password is invalide return 401
            if !(@teacher&.valid_password?(params[:password]))  
                head(:unauthorized)
                return
            end
            #Put api_token if it null
            if !@teacher.api_token
                token=set_api_token
                @teacher.api_token=token
                @teacher.save
            end
            #Read api_token
            #Render if the teacher enter the found and entered the right password
            render json: @teacher 

        end

        def destroy
            current_teacher.api_token= nil
            current_teacher.save
            render json: {
                message: "You are logged out!"
            }, status: :ok
        end

        private
        def set_api_token
            SecureRandom.hex(24)
        end

        def serializer
            TeacherSerializer
        end
    end
end