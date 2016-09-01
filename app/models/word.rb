# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Word < ApplicationRecord
end
