# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  pinyin     :string
#  birthday   :datetime
#  gender     :boolean
#  icon       :string
#  mobile     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'chinese_pinyin'

class User < ApplicationRecord
  before_save { self.pinyin = Pinyin.t(name, splitter: '') }

  def sex
    gender ? 'male' : 'female'
  end

  def zh_sex
    gender ? '他' : '她'
  end

  def age
    birthday.year - created_at.year
  end
end
