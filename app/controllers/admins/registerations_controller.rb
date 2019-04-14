module Admins
    class RegisterationsController < ApplicationController    
        def create
            resource = Admin.new(sign_up_params)
        
            if resource.save
                render json: resource
            else
                render json: resource.errors, status: :unprocessable_entity
            end
        end
    
        def destroy 
        end
    
        private
        
        def sign_up_params
            params.permit(:email, :password)
        end


        def serializer
            AdminSerializer
        end
    end
end
