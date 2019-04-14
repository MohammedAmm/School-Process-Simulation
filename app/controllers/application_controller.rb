class ApplicationController < ActionController::API
    #Note this added and not tested
    respond_to :json

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    private

    def render_resource(resource)
        if resource.errors.empty?
            render json: resource
        else
            validation_error(resource)
        end
    end

    def render_resources(resources)
            render json: resources
 
    end

    def validation_error(resource)
        render json: {
                errors: [
                            {
                                status: '400',
                                title: 'Bad Request',
                                detail: resource.errors,
                            }
                ]
                }, status: :bad_request
    end    
 
    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end
    
    def render(options={})

        if options[:status]
            super(options)
            return
        end

        options[:json] = serializer.new(options[:json])
        super(options)
    end

end
