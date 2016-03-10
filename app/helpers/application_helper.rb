module ApplicationHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def notice_message
    flash_messages = []

    flash.each do |key, msg|
      key = :success if key.to_sym == :notice
      key = :danger if key.to_sym == :alert
      text = content_tag(:div, link_to("x", "#", class: 'close', 'data-dismiss' => 'alert') + msg, class: "alert alert-#{key}")
      flash_messages << text if msg
    end

    flash_messages.join("\n").html_safe
  end

  def to_date
    to_date.to_s
  end
end
