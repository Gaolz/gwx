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

  def tag_links(tags)
    if current_admin?
      tags.split(',').map do |tag|
        link_to tag.strip, admin_tag_path(tag.strip)
      end.join(' ')
    else
      tags.split(',').map do |tag|
        link_to tag.strip, tag_path(tag.strip)
      end.join(' ')
    end
  end

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size - 1)
      yield(tag, claaes[index.round])
    end
  end
end
