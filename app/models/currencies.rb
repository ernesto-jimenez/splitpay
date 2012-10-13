class Currencies
  ALL = {
    :AUD => 'Australian Dollar',
    :BRL => 'Brazilian Real',
    :CAD => 'Canadian Dollar',
    :CZK => 'Czech Koruna',
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
    ALL.keys
  end
end
