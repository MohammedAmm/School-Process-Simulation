class MyFailureApp < Devise::FailureApp
    def http_auth_body
        {
            errors: [
                {
                    id: :unauthorized,
                    status: 401,
                    title: i18n_message
                }
            ]
        }.to_json
    end
    
    def redirect
        http_auth_body
    end
    
end