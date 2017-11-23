require 'rails_helper'

describe Tag do

  it { is_expected.to have_many(:posts).through(:taggings) }

  it { is_expected.to validate_uniqueness_of(:name) }
end
