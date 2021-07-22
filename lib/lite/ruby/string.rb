# frozen_string_literal: false

require 'yaml' unless defined?(YAML)

class String

  TRANSLITERATIONS = YAML.load_file(
    File.expand_path('formats/string_transliterations.yml', File.dirname(__FILE__))
  ).freeze

  def acronym
    gsub(/(([a-zA-Z0-9])([a-zA-Z0-9])*)./, '\\2') || self
  end

  def acronym!
    replace(acronym)
  end

  def any?(*keys)
    keys.any? { |key| include?(key) }
  end

  def camelize!(first_letter = :upper)
    replace(camelize(first_letter))
  end

  def capitalized?
    capitalize == self
  end

  def classify!
    replace(classify)
  end

  def dasherize!
    replace(dasherize)
  end

  def deconstantize!
    replace(deconstantize)
  end

  def dedupe(pattern)
    dup.dedupe!(pattern)
  end

  def dedupe!(pattern)
    pattern.each_char { |char| gsub!(/#{Regexp.escape(char)}{2,}/, char) }
    self
  end

  def demodulize!
    replace(demodulize)
  end

  def domain
    return self unless self =~ %r{^(?:\w+://)?([^/?]+)(?:/|\?|$)}

    Regexp.last_match(1)
  end

  def downcase?
    downcase == self
  end

  def each_word(&block)
    words.each(&block)
  end

  def ellipsize(ellipsize_at, options = {})
    return self if length <= ellipsize_at

    separator = options[:separator] || '...'
    offset = options[:offset] || 4

    "#{self[0, offset]}#{separator}#{self[-offset, offset]}"
  end

  def format(*args)
    super(self, *args.flatten)
  end

  def headerize
    squish.each_word(&:capitalize!).join(' ')
  end

  def headerize!
    replace(headerize)
  end

  def humanize!(capitalize: true)
    replace(humanize(capitalize: capitalize))
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

  def labelize(capitalize: true)
    dup.labelize!(capitalize: capitalize)
  end

  def labelize!(capitalize: true)
    underscore!
    tr!('_', ' ')
    squish!
    gsub!(/([a-z\d]*)/i, &:downcase)
    gsub!(/\A\w/) { |str| capitalize ? str.upcase : str }
    gsub!(/ id\z/, ' ID') || self
  end

  def lchomp(match)
    dup.lchomp!(match)
  end

  def lchomp!(match)
    return self unless index(match)

    self[0...match.size] = ''
    self
  end

  def methodize
    dup.methodize!
  end

  def methodize!
    gsub!(/([A-Z]+)([A-Z])/, '\1_\2')
    gsub!(/([a-z])([A-Z])/, '\1_\2')
    gsub!('/', '__')
    gsub!('::', '__')
    downcase! || self
  end

  def modulize
    dup.modulize!
  end

  def modulize!
    gsub!(/__(.?)/) { "::#{$1.upcase}" }
    gsub!(%r{/(.?)}) { "::#{$1.upcase}" }
    gsub!(/(?:_+|-+)([a-z])/) { $1.upcase }
    gsub!(/(\A|\s)([a-z])/) { $1 + $2.upcase } || self
  end

  def mixedcase?
    !upcase? && !downcase?
  end

  def non_possessive
    dup.non_possessive!
  end

  def non_possessive!
    return self unless possessive?

    chomp!("'s") || chomp!("'") || self
  end

  def ordinal
    to_i.ordinal
  end

  def ordinalize
    to_i.ordinalize
  end

  def parameterize!(separator: '-')
    replace(parameterize(separator: separator))
  end

  def pathize
    dup.pathize!
  end

  def pathize!
    gsub!(/([A-Z]+)([A-Z])/, '\1_\2')
    gsub!(/([a-z])([A-Z])/, '\1_\2')
    gsub!('__', '/')
    gsub!('::', '/')
    gsub!(/\s+/, '')
    gsub!(/[?%*:|"<>.]+/, '')
    downcase! || self
  end

  def pollute(delimiter = '^--^--^')
    chars.map { |chr| "#{chr}#{delimiter}" }.join
  end

  def pollute!(delimiter = '^--^--^')
    replace(pollute(delimiter))
  end

  def pop
    self[-1]
  end

  def possessive
    return self if possessive?

    possession = end_with?('s') ? "'" : "'s"
    "#{self}#{possession}"
  end

  def possessive!
    replace(possessive)
  end

  def possessive?
    %w['s s'].any? { |pos| end_with?(pos) }
  end

  def push(string)
    replace(concat(string))
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  def quote(type = :double, amount = nil)
    if type.is_a?(Integer)
      tmp = amount
      amount = type
      type = tmp || :mixed
    else
      amount ||= 1
    end

    case type.to_s
    when "'", 'single', 's', '1'
      f = "'" * amount
      b = f
    when '"', 'double', 'd', '2'
      f = '"' * amount
      b = f
    when '`', 'back', 'backtick', 'b', '-1'
      f = '`' * amount
      b = f
    when "`'", 'bracket', 'sb'
      f = '`' * amount
      b = "'" * amount
    when "'\"", 'mixed', 'm', 'Integer'
      c = (amount.to_f / 2).to_i
      f = '"' * c
      b = f

      if amount.odd?
        f = "'#{f}"
        b += "'"
      end
    else
      raise ArgumentError, "Invalid quote type: #{type.inspect}"
    end

    "#{f}#{self}#{b}"
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

  def quote!(type = :double, amount = nil)
    replace(quote(type, amount))
  end

  def remove_tags
    dup.remove_tags!
  end

  def remove_tags!
    gsub!(%r{</?[^>]*>}, '') || self
  end

  def rotate(amount = 1)
    dup.rotate!(amount)
  end

  def rotate!(amount = 1)
    amount += size if amount.negative?
    slice!(amount, size - amount) + slice!(0, amount)
  end

  # rubocop:disable Metrics/MethodLength
  def safe_encode(target_encoding, replacement = '')
    encode(target_encoding)
  rescue Encoding::InvalidByteSequenceError
    force_encoding(target_encoding).scrub!(replacement)
  rescue Encoding::UndefinedConversionError
    encode(
      target_encoding,
      invalid: :replace,
      undef: :replace,
      replace: replacement,
      UNIVERSAL_NEWLINE_DECORATOR: true
    )
  end
  # rubocop:enable Metrics/MethodLength

  def safe_encode!(target_encoding, replacement = '')
    replace(safe_encode(target_encoding, replacement))
  end

  def sample(separator = ' ')
    split(separator).sample
  end

  def sample!(separator = ' ')
    replace(sample(separator))
  end

  def shift(*patterns)
    dup.shift!(*patterns)
  end

  def shift!(*patterns)
    return self[0] if patterns.empty?

    patterns.each_with_object(self) { |pat, str| str.sub!(pat, '') }
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
           else raise TypeError, "Invalid parameter: #{keep.inspect}"
           end

    chars.keep_if { |chr| keep.include?(chr) }.join
  end

  def sift!(keep)
    replace(sift(keep))
  end

  def slugify
    dup.slugify!
  end

  def slugify!
    gsub!(/[^\x00-\x7F]+/, '')
    gsub!(/[^\w \-]+/i, '')
    gsub!(/[ \-]+/i, '-')
    gsub!(/^-|-$/i, '')
    downcase! || self
  end

  def sort
    chars.sort.join
  end

  def sort!
    replace(sort)
  end

  def transliterize
    TRANSLITERATIONS.each_with_object(dup) { |(k, v), s| s.gsub!(k, v) }
  end

  def transliterize!
    replace(transliterize)
  end

  def titleize!
    replace(titleize)
  end

  def upcase?
    upcase == self
  end

  def underscore!
    replace(underscore)
  end

  def unpollute(delimiter = '^--^--^')
    dup.unpollute!(delimiter)
  end

  def unpollute!(delimiter = '^--^--^')
    gsub!(delimiter, '') || self
  end

  def unquote
    dup.unquote!
  end

  def unquote!
    [0, -1].each do |i|
      case self[i, 1]
      when "'", '"', '`' then self[i] = ''
      end
    end

    self
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
    str.words
  end

  def variablize
    "@#{gsub(/\W/, '_')}"
  end

  def variablize!
    replace(variablize)
  end

  alias camelcase! camelize!
  alias labelcase labelize
  alias labelcase! labelize!
  alias snakecase! underscore!
  alias titlecase! titleize!

end

require 'lite/ruby/safe/string' unless defined?(ActiveSupport)
