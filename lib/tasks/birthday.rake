# encoding: utf-8
require 'chinese_lunar/lunar'

namespace :glz do
  desc "检查今天是否有人过生"
  task :birth => :environment do
    lunar = ChineseLunar::Lunar.new.lunar_date # '2016-08-23'
    birthdays = User.pluck(:id,:birthday).select do |user|
      user[1].to_date.to_s == lunar
    end
    if birthdays.present?
      birthdays.each do |birthday|
        user = User.find birthday[0]
        BirthdayMessageJob.perform_async(user.id)
        Rails.logger.info "*******今天是#{user.name}的生日!!!***********"
        user.update!(birthday: user.birthday + 1.year)
      end
    end
  end
end
