# == Schema Information
#
# Table name: accounts
#
#  id          :integer          not null, primary key
#  description :string           not null
#  price       :decimal(6, 2)    not null
#  created_at  :datetime         not null
#

class Account < ActiveRecord::Base
end
