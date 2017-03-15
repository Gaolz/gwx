module ApplicationHelper
  include LetterAvatar::AvatarHelper

  EMPTY_STRING = ''.freeze

  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def notice_message
    flash_messages = []

    flash.each do |key, msg|
      key = :success if key.to_sym == :notice
      key = :danger if key.to_sym == :alert
      text = content_tag(:div, link_to('x', '#', class: 'close', 'data-dismiss' => 'alert') + msg, class: "alert alert-#{key}")
      flash_messages << text if msg
    end

    flash_messages.join("\n").html_safe
  end

  def to_date
    to_date.to_s
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def word_color
    "bg-".concat %w(primary success info warning danger).sample
  end

  def render_list(opts = {})
    list = []
    yield(list)
    items = []
    list.each do |link|
      item_class = EMPTY_STRING
      urls = link.match(/href=(["'])(.*?)(\1)/) || []
      url = urls.length > 2 ? urls[2] : nil
      if url && current_page?(url) || (@current && @current.include?(url))
        item_class = 'active'
      end
      items << content_tag('li', raw(link), class: item_class)
    end
    content_tag('ul', raw(items.join(EMPTY_STRING)), opts)
  end

  def render_list(opts = {})
    list = []
    yield(list)
    items = []
    list.each do |link|
      item_class = EMPTY_STRING
      urls = link.match(/href=([""])(.*?)(\1)/) || []
      url = urls.length > 2 ? urls[2] : nil
      if url && current_page?(url) || (@current && @current.include?(url))
        item_class = 'active'
      end
      items << content_tag('li', raw(link), class: (item_class + ' nav-item'))
    end
    content_tag('ul', raw(items.join(EMPTY_STRING)), opts)
  end
end
