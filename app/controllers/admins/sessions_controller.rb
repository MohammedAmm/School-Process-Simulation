module Admins
    require 'securerandom'

    class SessionsController < ApplicationController
        before_action :authenticate_admin!, only: [:destroy]

        def create
            #First find the admin
            @admin = Admin.where(email: params[:email]).first
            #IF not exists or password is invalide return 401
            if !(@admin&.valid_password?(params[:password]))  
                head(:unauthorized)
                return
            end
            #Put api_token if it null
            if !@admin.api_token
                token=set_api_token
                @admin.api_token=token
                @admin.save
            end
            #Read api_token
            #Render if the admin enter the found and entered the right password
            render json: @admin 

        end

        def destroy
            current_admin.api_token= nil
            current_admin.save
            render json: {
                message: "You are logged out!"
            }, status: :ok
        end

        private
        def set_api_token
            SecureRandom.hex(24)
        end

        def serializer
            AdminSerializer
        end
    end
end