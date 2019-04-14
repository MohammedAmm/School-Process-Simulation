class TeacherApiTokenStrategy < Warden::Strategies::Base
    def valid?
        api_token.present?
    end
    
    def authenticate!
        teacher = Teacher.find_by(api_token: api_token)
        
        if teacher
          success!(teacher)
        else
          fail!('Invalid email or password')
        end
    end

    private
    
    def api_token
        env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
    end
end