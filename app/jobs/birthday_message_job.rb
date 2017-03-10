# encoding: utf-8

class BirthdayMessageJob < ApplicationJob
  self.queue_adapter = :sucker_punch
  include SuckerPunch::Job
  queue_as :birthday_message

  def perform(user_id)
    user = User.find(user_id)
    mobiles = %w(13730820749 18382012700)
    receivers = User.where(mobile: mobiles)
    receivers.each do |receiver|
      feedback = ChinaSMS.to receiver.mobile, %Q(【高老庄】亲爱的#{receiver.name}，今天是你的亲人#{user.name}，#{user.age}岁的生日，请对#{user.zh_sex}说声“生日快乐”，方便的话，也不要吝啬的你的双手，给#{user.zh_sex}一个真诚的拥抱。)
      if feedback["code"] == 0
        Rails.logger.info "*******今天#{Date.today}是#{user.name}的生日!!!***********"
      else
        Rails.logger.error %Q(****#{Date.today}-msg: #{feedback["msg"]}, detail: "#{feedback["detail"]}"***)
      end
    end
  end
end
