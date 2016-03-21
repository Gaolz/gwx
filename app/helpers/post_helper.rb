module PostHelper
  def emojify(content)
    h(content).to_str.gsub(/:([\w+]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#{$1}" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end

  # 👹👹👹
  def numbers_of_content(post)
    content = strip_tags(post.content)
    content = content.for_each_continous_cjk_alpha_part
    content.inject(0) do |sum, word|
      word.contains_cjk? ? sum += word.size : sum += word.split.size
    end
  end
end
