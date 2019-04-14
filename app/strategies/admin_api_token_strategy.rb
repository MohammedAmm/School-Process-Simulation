class AdminApiTokenStrategy < Warden::Strategies::Base
    def valid?
        api_token.present?
    end
    
    def authenticate!
        admin = Admin.find_by(api_token: api_token)
        
        if admin
          success!(admin)
        else
          fail!('Invalid email or password')
        end
    end

    private
    
    def api_token
        env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
    end
end