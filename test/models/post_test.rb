require 'test_helper'

describe Post do
  it 'can be valid' do
    post = Post.new title: 'foo', content: 'bar'
    post.url_title = Pinyin.t(post.title, splitter: '-')
    post.valid?.must_equal true
  end

  it 'can be invalid' do
    user = Post.new
    user.valid?.wont_equal true
  end
end
