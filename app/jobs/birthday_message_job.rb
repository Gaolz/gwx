class BirthdayMessageJob < ApplicationJob
  self.queue_adapter = :sucker_punch
  include SuckerPunch::Job
  queue_as :birthday_message

  def perform(user_id)
    user = User.find(user_id)
    mobiles = %w(13730820749 18382012700)
    receivers = User.where(mobile: mobile)
    receivers.each do |receiver|
      ChinaSMS.to receiver.mobile, "【高老庄】亲爱的#{reciever.name}，今天是你的亲人#{user.name}，#{user.age}岁的生日，请对#{user.zh_sex}说声“生日快乐”，方便的话，也不要吝啬的你的双手，给#{user.zh_sex}一个真诚的拥抱。"
    end
  end
end
