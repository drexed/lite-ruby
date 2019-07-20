# frozen_string_literal: false

class String

  TRANSLITERATIONS ||= {
    'À' => 'A', 'Á' => 'A', 'Â' => 'A', 'Ã' => 'A', 'Ä' => 'A', 'Å' => 'A', 'Æ' => 'Ae',
    'Ç' => 'C', 'È' => 'E', 'É' => 'E', 'Ê' => 'E', 'Ë' => 'E', 'Ì' => 'I', 'Í' => 'I',
    'Î' => 'I', 'Ï' => 'I', 'Ð' => 'D', 'Ñ' => 'N', 'Ò' => 'O', 'Ó' => 'O', 'Ô' => 'O',
    'Õ' => 'O', 'Ö' => 'O', 'Ø' => 'O', 'Ù' => 'U', 'Ú' => 'U', 'Û' => 'U', 'Ü' => 'U',
    'Ý' => 'Y', 'Þ' => 'Th', 'ß' => 'ss', 'à' => 'a', 'á' => 'a', 'â' => 'a', 'ã' => 'a',
    'ä' => 'a', 'å' => 'a', 'æ' => 'ae', 'ç' => 'c', 'è' => 'e', 'é' => 'e', 'ê' => 'e',
    'ë' => 'e', 'ì' => 'i', 'í' => 'i', 'î' => 'i', 'ï' => 'i', 'ð' => 'd', 'ñ' => 'n',
    'ò' => 'o', 'ó' => 'o', 'ô' => 'o', 'õ' => 'o', 'ö' => 'o', 'ø' => 'o', 'ù' => 'u',
    'ú' => 'u', 'û' => 'u', 'ü' => 'u', 'ý' => 'y', 'þ' => 'th', 'ÿ' => 'y', 'Ā' => 'A',
    'ā' => 'a', 'Ă' => 'A', 'ă' => 'a', 'Ą' => 'A', 'ą' => 'a', 'Ć' => 'C', 'ć' => 'c',
    'Ĉ' => 'C', 'ĉ' => 'c', 'Ċ' => 'C', 'ċ' => 'c', 'Č' => 'C', 'č' => 'c', 'Ď' => 'D',
    'ď' => 'd', 'Đ' => 'D', 'đ' => 'd', 'Ē' => 'E', 'ē' => 'e', 'Ĕ' => 'E', 'ĕ' => 'e',
    'Ė' => 'E', 'ė' => 'e', 'Ę' => 'E', 'ę' => 'e', 'Ě' => 'E', 'ě' => 'e', 'Ĝ' => 'G',
    'ĝ' => 'g', 'Ğ' => 'G', 'ğ' => 'g', 'Ġ' => 'G', 'ġ' => 'g', 'Ģ' => 'G', 'ģ' => 'g',
    'Ĥ' => 'H', 'ĥ' => 'h', 'Ħ' => 'H', 'ħ' => 'h', 'Ĩ' => 'I', 'ĩ' => 'i', 'Ī' => 'I',
    'ī' => 'i', 'Ĭ' => 'I', 'ĭ' => 'i', 'Į' => 'I', 'į' => 'i', 'İ' => 'I', 'ı' => 'i',
    'Ĳ' => 'Ij', 'ĳ' => 'ij', 'Ĵ' => 'J', 'ĵ' => 'j', 'Ķ' => 'K', 'ķ' => 'k', 'ĸ' => 'k',
    'Ĺ' => 'L', 'ĺ' => 'l', 'Ļ' => 'L', 'ļ' => 'l', 'Ľ' => 'L', 'ľ' => 'l', 'Ŀ' => 'L',
    'ŀ' => 'l', 'Ł' => 'L', 'ł' => 'l', 'Ń' => 'N', 'ń' => 'n', 'Ņ' => 'N', 'ņ' => 'n',
    'Ň' => 'N', 'ň' => 'n', 'ŉ' => 'n', 'Ŋ' => 'Ng', 'ŋ' => 'ng', 'Ō' => 'O', 'ō' => 'o',
    'Ŏ' => 'O', 'ŏ' => 'o', 'Ő' => 'O', 'ő' => 'o', 'Œ' => 'OE', 'œ' => 'oe', 'Ŕ' => 'R',
    'ŕ' => 'r', 'Ŗ' => 'R', 'ŗ' => 'r', 'Ř' => 'R', 'ř' => 'r', 'Ś' => 'S', 'ś' => 's',
    'Ŝ' => 'S', 'ŝ' => 's', 'Ş' => 'S', 'ş' => 's', 'Š' => 'S', 'š' => 's', 'Ţ' => 'T',
    'ţ' => 't', 'Ť' => 'T', 'ť' => 't', 'Ŧ' => 'T', 'ŧ' => 't', 'Ũ' => 'U', 'ũ' => 'u',
    'Ū' => 'U', 'ū' => 'u', 'Ŭ' => 'U', 'ŭ' => 'u', 'Ů' => 'U', 'ů' => 'u', 'Ű' => 'U',
    'ű' => 'u', 'Ų' => 'U', 'ų' => 'u', 'Ŵ' => 'W', 'ŵ' => 'w', 'Ŷ' => 'Y', 'ŷ' => 'y',
    'Ÿ' => 'Y', 'Ź' => 'Z', 'ź' => 'z', 'Ż' => 'Z', 'ż' => 'z', 'Ž' => 'Z', 'ž' => 'z'
  }.freeze

  def acronym
    gsub(/(([a-zA-Z0-9])([a-zA-Z0-9])*)./, '\\2')
  end

  def acronym!
    replace(acronym)
  end

  def any?(*keys)
    keys.any? { |key| include?(key) }
  end

  def ascii_only(alt = '')
    dup.encode_only!('ASCII', alt)
  end

  def ascii_only!(alt = '')
    encode_only!('ASCII', alt)
  end

  def at(position)
    self[position]
  end

  def camelize(first_letter = :upper)
    case first_letter
    when :upper, true then str.gsub(/(\A|\s)([a-z])/) { $1 + $2.upcase }
    when :lower, false then str.gsub(/(\A|\s)([A-Z])/) { $1 + $2.downcase }
    end
  end

  alias camelcase camelize

  def camelize!(first_letter = :upper)
    replace(camelize(first_letter))
  end

  alias camelcase! camelize!

  def capitalized?
    capitalize == self
  end

  def classify
    to_s.sub(/.*\./, '').camelize
  end

  def classify!
    replace(classify)
  end

  def constantize
    Object.const_get(self)
  end

  def dasherize
    tr(/_/, '-')
  end

  def dasherize!
    replace(dasherize)
  end

  def deconstantize
    to_s[0, rindex('::') || 0]
  end

  def deconstantize!
    replace(deconstantize)
  end

  def demodulize
    to_s.gsub(/^.*::/, '')
  end

  def demodulize!
    replace(demodulize)
  end

  def domain
    return self unless self =~ %r{^(?:\w+:\/\/)?([^\/?]+)(?:\/|\?|$)}

    Regexp.last_match(1)
  end

  def downcase?
    downcase == self
  end

  def encode_only(encoding, alt = '')
    dup.encode_only!(encoding, alt)
  end

  def encode_only!(encoding, alt = '')
    encoding_options = {
      invalid: :replace,
      undef: :replace,
      replace: alt,
      UNIVERSAL_NEWLINE_DECORATOR: true
    }

    encode!(Encoding.find(encoding), encoding_options)
  end

  def ellipsize(ellipsize_at, options = {})
    return self if length <= ellipsize_at

    separator = options[:separator] || '...'
    offset = options[:offset] || 4

    "#{self[0, offset]}#{separator}#{self[-offset, offset]}"
  end

  def first(limit = 1)
    if limit.zero?
      ''
    elsif limit >= length
      self
    else
      to(limit - 1)
    end
  end

  def format(*args)
    super(self, *args.flatten)
  end

  def from(position)
    self[position..-1]
  end

  def headerize
    squish.split(' ').map(&:capitalize).join(' ')
  end

  def headerize!
    replace(headerize)
  end

  def humanize(options = {})
    capitalize = options[:capitalize] || true

    underscore.gsub(/_id\z/, '')
              .tr('_', ' ')
              .squish
              .gsub(/([a-z\d]*)/i, &:downcase)
              .gsub(/\A\w/) { |str| capitalize ? str.upcase : str }
  end

  def humanize!(options = {})
    replace(humanize(options))
  end

  def indent(amount, indent_string = nil, indent_empty_lines = false)
    indent_string = indent_string || self[/^[ \t]/] || ' '
    substitutes = indent_empty_lines ? /^/ : /^(?!$)/

    gsub(substitutes, indent_string * amount)
  end

  def indent!(amount, indent_string = nil, indent_empty_lines = false)
    replace(indent(amount, indent_string, indent_empty_lines))
  end

  def index_all(pattern)
    pattern = pattern.to_s if pattern.is_a?(Numeric)
    arr_indexes = []
    srch_index = rindex(pattern)

    while srch_index
      temp_string = self[0..(srch_index - 1)]
      arr_indexes << srch_index
      srch_index = srch_index.zero? ? nil : temp_string.rindex(pattern)
    end

    arr_indexes.reverse
  end

  def labelize(options = {})
    capitalize = options[:capitalize] || true

    underscore.tr('_', ' ')
              .squish
              .gsub(/([a-z\d]*)/i, &:downcase)
              .gsub(/\A\w/) { |str| capitalize ? str.upcase : str }
              .gsub(/ id\z/, ' ID')
  end

  alias labelcase labelize

  def labelize!(options = {})
    replace(labelize(options))
  end

  alias labelcase! labelize!

  def last(limit = 1)
    if limit.zero?
      ''
    elsif limit >= length
      self
    else
      from(-limit)
    end
  end

  def mixedcase?
    !upcase? && !downcase?
  end

  def ordinal
    to_i.ordinal
  end

  def ordinalize
    to_i.ordinalize
  end

  def parameterize(separator: '-')
    underscore.gsub(/\s+/, separator).downcase
  end

  def parameterize!(separator: '-')
    replace(parameterize(separator: separator))
  end

  def pollute(delimiter = '^--^--^')
    split('').map { |chr| "#{chr}#{delimiter}" }.join
  end

  def pollute!(delimiter = '^--^--^')
    replace(pollute(delimiter))
  end

  def pop
    self[-1]
  end

  def push(string)
    replace(concat(string))
  end

  def remove(*patterns)
    patterns.each_with_object(dup) do |pat, str|
      pat.is_a?(Range) ? str.slice!(pat) : str.gsub!(pat, '')
    end
  end

  def remove!(*patterns)
    replace(remove(*patterns))
  end

  def remove_tags
    gsub(%r{<\/?[^>]*>}, '')
  end

  def remove_tags!
    replace(remove_tags)
  end

  def sample(separator = ' ')
    split(separator).sample
  end

  def sample!(separator = ' ')
    replace(sample(separator))
  end

  def shift(*patterns)
    return self[0] if patterns.empty?

    patterns.each_with_object(dup) { |pat, str| str.sub!(pat, '') }
  end

  def shift!(*patterns)
    replace(shift(*patterns))
  end

  def shuffle(separator = '')
    split(separator).shuffle.join
  end

  def shuffle!(separator = '')
    replace(shuffle(separator))
  end

  def sift(keep)
    keep = case keep
           when String then keep.chars
           when Array then keep.map(&:to_s)
           when Range then keep.to_a.map(&:to_s)
           else raise TypeError, "Invalid parameter #{keep.inspect}"
           end

    chars.keep_if { |chr| keep.include?(chr) }.join
  end

  def sift!(keep)
    replace(sift(keep))
  end

  def slugify
    to_s.gsub(/[^\x00-\x7F]+/, '')
        .gsub(/[^\w_ \-]+/i, '')
        .gsub(/[ \-]+/i, '-')
        .gsub(/^\-|\-$/i, '')
        .downcase
  end

  def slugify!
    replace(slugify)
  end

  def squish
    strip.gsub(/\s+/, ' ')
  end

  def squish!
    replace(squish)
  end

  def sort
    chars.sort.join
  end

  def sort!
    replace(sort)
  end

  def titleize
    underscore.humanize.gsub(/\b(?<!['’`])[a-z]/) { $&.capitalize }
  end

  alias titlecase titleize

  def titleize!
    replace(titleize)
  end

  alias titlecase! titleize!

  def to(position)
    self[0..position]
  end

  def transliterize
    dup.transliterize!
  end

  def transliterize!
    TRANSLITERATIONS.each_with_object(self) { |(k, v), str| str.gsub!(k, v) }
  end

  def truncate(truncate_at, options = {})
    return dup unless length > truncate_at

    seperator = options[:separator]
    omission = options[:omission] || '...'
    size_with_room_for_omission = truncate_at - omission.length

    stop = if seperator
             rindex(seperator || '', size_with_room_for_omission) || size_with_room_for_omission
           else
             size_with_room_for_omission
           end

    "#{self[0, stop]}#{omission}"
  end

  def truncate_words(words_count, options = {})
    sep = options[:separator] || /\s+/
    sep = Regexp.escape(sep.to_s) unless sep.is_a(Regexp)
    return self unless self =~ /\A((?:.+?#{sep}){#{words_count - 1}}.+?)#{sep}.*/m

    "#{::Regexp.last_match(1)}#{options[:omissio] || '...'}"
  end

  def underscore
    to_s.gsub(/::/, '/')
        .gsub(/([A-Z\d]+)([A-Z][a-z])/, "\1_\2")
        .gsub(/([a-z\d])([A-Z])/, "\1_\2")
        .tr('-', '_')
        .downcase
  end

  def underscore!
    replace(underscore)
  end

  def unpollute(delimiter = '^--^--^')
    gsub(delimiter, '')
  end

  def unpollute!(delimiter = '^--^--^')
    replace(unpollute(delimiter))
  end

  def upcase?
    upcase == self
  end

  def unshift(*patterns)
    patterns.each_with_object('') { |pat, str| str << pat }
            .concat(self)
  end

  def unshift!(*patterns)
    replace(unshift(*patterns))
  end

  def words
    split(/\s+/)
  end

  def words_without_punctuation
    str = dup
    str.gsub!(%r{[.?¿¡…!,:：;—"。？！、‘“”„«»〈〉《》，/\[\]]}, ' ')
    str.gsub!('- ', ' ')
    str.squeeze!(' ')
    str.strip!
    str.split(' ')
  end

end
