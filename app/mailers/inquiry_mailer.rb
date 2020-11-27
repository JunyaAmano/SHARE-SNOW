class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    mail to: ENV['GMAIL_ADDRESS'], subject: "メールのタイトル"
  end

end
