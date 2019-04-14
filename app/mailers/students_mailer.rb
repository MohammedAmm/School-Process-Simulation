class StudentsMailer < ApplicationMailer 
    def count_email(csv)
      attachments["students#{Date.current}.csv"] = {mime_type: 'text/csv', content: csv}
      @email='mohammed.ashraaf.ma@gmail.com'
      mail(to: @email, subject: 'Students CSV')
    end
end
