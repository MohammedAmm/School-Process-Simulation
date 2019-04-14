class StudentsController < ActionController::Base
    def index
      # ExportJob.perform_later
      # head :accepted
      ExportWorker.perform_async()
    end
    
end