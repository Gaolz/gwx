# encoding: utf-8

class WordJob < ApplicationJob
  queue_as :word

  def perform()
    # Todo: mobile = User.subscriber.pluck(:mobile)
    mobiles = %w(13730820749 18382012700)
    message = "【高老庄】Now or never, it's #{Date.today}, go go go. Strict self-discipline"
    mobiles.each do |mobile|
      feedback = ChinaSMS.to mobile, message 
      Rails.logger.error %Q(****#{Date.today}-msg: #{feedback["msg"]}, detail: "#{feedback["detail"]}"***) if feedback["code"] != 0
    end
  end
end
