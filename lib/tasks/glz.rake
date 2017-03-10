# encoding: utf-8
require 'chinese_lunar/lunar'

namespace :glz do
  desc "检查今天是否有人过生"
  task :birth => :environment do
    lunar = ChineseLunar::Lunar.new.lunar_date # '2016-08-23'
    return if User.count.zero?
    birthdays = User.pluck(:id,:birthday).select do |user|
      user[1].to_date.to_s == lunar
    end
    if birthdays.flatten.present?
      birthdays.each do |birthday|
        begin
          user = User.find birthday[0]
          BirthdayMessageJob.perform_async(user.id)
        ensure
          user.update!(birthday: user.birthday + 1.year)
        end
      end
    end
  end

  desc "激励"
  task :word => :environment do
    WordJob.perform_now()
  end
end
