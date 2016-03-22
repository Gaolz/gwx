class String
  def contains_han?
    self =~ /\p{Han}/
  end

  def only_word
    gsub(/[^-’[^\p{P}]]|’$|’”$/, '\1')
  end

  def contains_cjk?
    self =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/
  end

  def for_each_continous_cjk_alpha_part
    split_into_cjk_alpha_phrases.each.with_index do |part, i|
      yield part, i if block_given?
    end
  end

  def split_into_cjk_alpha_phrases
    identify_cjk_alpha_ranges.map do |range|
      self[range]
    end
  end

  private

  def identify_cjk_alpha_ranges
    split_index = identify_cjk_alpha_split_indexes
    capped_split_index =  case
                          when split_index.first != 0 && split_index.last != (length - 1)
                            [0] + split_index + [(length - 1)]
                          when split_index.first != 0
                            [0] + split_index
                          when split_index.last != (length - 1)
                            split_index + [(length - 1)]
                          else
                            split_index
                          end
    capped_split_index.each_cons(2).map do |(x, y)|
      if x == 0
        (x..y)
      else
        ((x + 1)..y)
      end
    end
  end

  def identify_cjk_alpha_split_indexes
    consecutive_pairs = split('').each_cons(2).to_a
    consecutive_pairs.map.with_index do |(x, y), i|
      if x.contains_cjk? != y.contains_cjk?
        i
      end
    end.reject(&:nil?)
  end
end
