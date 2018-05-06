class JapaneseDate
  include Comparable
  CALENDAR_FORMATS = %i[japanese western].freeze
  DEFAULT_CALENDAR_FORMAT = :western

  attr_reader :date, :calendar_format, :western_date

  def initialize(date, format = DEFAULT_CALENDAR_FORMAT)
    @calendar_format = case format
                       when *CALENDAR_FORMATS then format
                       else DEFAULT_CALENDAR_FORMAT
                       end
    send(:"init_dates_from_#{format}", date)
  end

  def self.from_western(date)
    new(date, :western)
  end

  def self.from_japanese(date)
    new(date, :japanese)
  end

  def <=>(other)
    western_date <=> other.western_date
  end

  def to_h
    { date: date, format: calendar_format, western_date: western_date }
  end

  private

  def init_dates_from_western(date)
    @date = convert_date_to_japanese_date date
    @western_date = date
  end

  def init_dates_from_japanese(date)
    @date = date
    @western_date = convert_japanese_date_to_date date
  end

  def convert_japanese_date_to_date(date)
    year, month = date.tr('H', '').split('.').map(&:to_i)
    @western_date = Date.new((year + 1988), month)
  end

  def convert_date_to_japanese_date(date)
    @date = "H#{date.year - 1988}.#{date.month}"
  end
end
