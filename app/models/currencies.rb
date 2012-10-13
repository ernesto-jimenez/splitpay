#encoding: utf-8

class Currencies
  ALL = [
    {code: 'EUR', long: 'Euro', short: 'EUR €', tiny: '€', format: "%n %u"},
    {code: 'GBP', long: 'Pound Sterling', short: 'GBP £', tiny: '£', format: "%u%n"},
    {code: 'USD', long: 'U.S. Dollars', short: 'USD $', tiny: '$', format: "%u%n"},
  ]
  CODES = ALL.collect { |currency| currency[:code] }
  SELECT_OPTIONS = ALL.collect { |currency| [currency[:short], currency[:code]] }
  DETAIL = Hash[ALL.collect { |c| [c[:code], {format: c[:format], unit: c[:tiny]}] }]
  {
    :AUD => {long: 'Australian Dollar', short: 'AUD $', tiny: 'A$'},
    :BRL => {long: 'Brazilian Real', short: 'BRL $', tiny: 'R$'},
    :CAD => {long: 'Canadian Dollar', short: 'CAD $', tiny: 'C$'},
    :CZK => {long: 'Czech Koruna', short: 'CZK Kč', tiny: 'Kč'},
    :DKK => 'Danish Krone',
    :EUR => 'Euro',
    :HKD => 'Hong Kong Dollar',
    :HUF => 'Hungarian Forint',
    :ILS => 'Israeli New Sheqel',
    :JPY => 'Japanese Yen',
    :MYR => 'Malaysian Ringgit',
    :MXN => 'Mexican Peso',
    :NOK => 'Norwegian Krone',
    :NZD => 'New Zealand Dollar',
    :PHP => 'Philippine Peso',
    :PLN => 'Polish Zloty',
    :GBP => 'Pound Sterling',
    :SGD => 'Singapore Dollar',
    :SEK => 'Swedish Krona',
    :CHF => 'Swiss Franc',
    :TWD => 'Taiwan New Dollar',
    :THB => 'Thai Baht',
    :TRY => 'Turkish Lira',
    :USD => 'U.S. Dollar'
  }

  def self.keys
    CODES
  end

  def self.select_options
    SELECT_OPTIONS
  end

  def self.detail(currency)
    Rails.logger.debug DETAIL[currency]
    DETAIL[currency]
  end
end
