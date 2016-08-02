require 'chinese_pinyin'

class User < ApplicationRecord
  before_save { self.pinyin = Pinyin.t(name, splitter: '') }

  def sex
    gender ? 'male' : 'female'
  end
end
