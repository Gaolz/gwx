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
      if word.contains_cjk?
        sum += word.only_word.size
      else
        sum += word.gsub(/[\p{Punctuation}\p{Symbol}]|\u00A0/, '').split.size
      end
    end
  end
end
