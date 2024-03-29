# frozen_string_literal: true

class String

  def at(position)
    self[position]
  end

  def camelize(first_letter = :upper)
    case first_letter
    when :upper, true then modulize.gsub(/(\A|\s)([a-z])/) { $1 + $2.upcase }
    when :lower, false then modulize.gsub(/(\A|\s)([A-Z])/) { $1 + $2.downcase }
    else modulize
    end
  end

  def classify
    str = dup
    str.sub!(/.*\./, '')
    str.camelize!
    str || self
  end

  def constantize
    Object.const_get(camelize)
  end

  def dasherize
    underscore.tr('_', '-')
  end

  def deconstantize
    [0, rindex('::') || 0]
  end

  def demodulize
    gsub(/^.*::/, '')
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

  def from(position)
    self[position..-1]
  end

  def humanize(capitalize: true)
    str = dup
    str.underscore!
    str.delete_suffix!('_id')
    str.tr!('_', ' ')
    str.squish!
    str.gsub!(/([a-z\d]*)/i, &:downcase)
    str.gsub!(/\A\w/) { |s| capitalize ? s.upcase : s }
    str || self
  end

  def indent(amount, seperator = ' ')
    dup.indent!(amount, seperator)
  end

  def indent!(amount, seperator = ' ')
    if amount >= 0
      gsub!(/^/, seperator * amount)
    else
      gsub!(/^#{Regexp.escape(seperator)}{0,#{-amount}}/, '')
    end
  end

  def last(limit = 1)
    if limit.zero?
      ''
    elsif limit >= length
      self
    else
      from(-limit)
    end
  end

  def parameterize(separator: '-')
    str = dup
    str.underscore!
    str.gsub!(/\s+/, separator)
    str.downcase!
    str || self
  end

  def remove(*patterns)
    dup.remove!(*patterns)
  end

  def remove!(*patterns)
    patterns.each_with_object(self) do |pat, str|
      pat.is_a?(Range) ? str.slice!(pat) : str.gsub!(pat, '')
    end
  end

  def squish
    dup.squish!
  end

  def squish!
    strip!
    gsub!(/\s+/, ' ') || self
  end

  def titleize
    str = dup
    str.underscore!
    str.humanize!
    str.gsub!(/\b(?<!['’`])[a-z]/) { $&.capitalize }
    str || self
  end

  def to(position)
    self[0..position]
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
  def to_time(form = :local)
    parts = Date.parse(self, false)
    used_keys = %i[year mon mday hour min sec sec_fraction offset]
    return if (parts.keys & used_keys).empty?

    now = Time.now
    time = Time.new(
      parts[:year] || now.year,
      parts[:mon] || now.month,
      parts[:mday] || now.day,
      parts[:hour] || 0,
      parts[:min] || 0,
      (parts[:sec] || 0) + (parts[:sec_fraction] || 0),
      parts[:offset] || (form == :utc ? 0 : nil)
    )

    form == :utc ? time.utc : time.to_time
  end
  # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity

  def truncate(truncate_at, options = {})
    return self unless length > truncate_at

    omission = options[:omission] || '...'
    seperator = options[:separator]
    size_with_room_for_omission = truncate_at - omission.length
    stop = rindex(seperator || '', size_with_room_for_omission) if seperator
    "#{self[0, stop || size_with_room_for_omission]}#{omission}"
  end

  def truncate_words(words_count, options = {})
    sep = options[:separator] || /\s+/
    sep = Regexp.escape(sep.to_s) unless sep.is_a?(Regexp)
    return dup unless self =~ /\A((?>.+?#{sep}){#{words_count - 1}}.+?)#{sep}.*/m

    $1 + (options[:omission] || '...')
  end

  def underscore
    str = dup
    str.camelize!
    str.gsub!(/::/, '/')
    str.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
    str.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    str.tr!('-', '_')
    str.downcase!
    str || self
  end

  alias camelcase camelize
  alias ends_with? end_with?
  alias snakecase underscore
  alias starts_with? start_with?
  alias titlecase titleize
  alias to_t to_time unless defined?(to_t)

end
