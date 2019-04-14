class ErrorsController < ApplicationController
        def not_found
            render :json => {:error => "The page not found"}.to_json, :status => 404
        end

      private
      def serializer
      end
end