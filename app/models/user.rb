require 'chinese_pinyin'

class User < ApplicationRecord
  before_save { self.pinyin = Pinyin.t(name, splitter: '') }

  def sex
    gender ? 'male' : 'female'
  end

  def zh_sex
    gender ? '他' : '她'
  end
end
