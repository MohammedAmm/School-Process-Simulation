class FetchAllCourses
    include Callable
    def initialize()
      @user = User.find(user_id)
    end
    
    def call
      #…
      Course.all
    end
  end