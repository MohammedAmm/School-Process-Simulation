class ExportWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    @students= Student.all
    StudentsMailer.count_email(@students.to_csv).deliver_now

  end
end
