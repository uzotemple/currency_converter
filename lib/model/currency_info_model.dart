class CurrencyInfo {
  final String abbreviation;
  final String symbol;
  final String country;

  CurrencyInfo({required this.abbreviation, required this.symbol, required this.country});
}

// Sample currency data
final List<CurrencyInfo> currencyList = [
  CurrencyInfo(abbreviation: 'USD', symbol: '\$', country: 'United States'),
  CurrencyInfo(abbreviation: 'EUR', symbol: '€', country: 'Eurozone'),
  CurrencyInfo(abbreviation: 'GBP', symbol: '£', country: 'United Kingdom'),
  CurrencyInfo(abbreviation: 'NGN', symbol: '₦', country: 'Nigeria'),
  CurrencyInfo(abbreviation: 'JPY', symbol: '¥', country: 'Japan'),
  CurrencyInfo(abbreviation: 'AUD', symbol: 'A\$', country: 'Australia'),
  CurrencyInfo(abbreviation: 'CAD', symbol: 'C\$', country: 'Canada'),
  CurrencyInfo(abbreviation: 'CHF', symbol: 'CHF', country: 'Switzerland'),
  CurrencyInfo(abbreviation: 'CNY', symbol: '¥', country: 'China'),
  CurrencyInfo(abbreviation: 'SEK', symbol: 'kr', country: 'Sweden'),
  CurrencyInfo(abbreviation: 'NZD', symbol: 'NZ\$', country: 'New Zealand'),
  CurrencyInfo(abbreviation: 'INR', symbol: '₹', country: 'India'),
  CurrencyInfo(abbreviation: 'BRL', symbol: 'R\$', country: 'Brazil'),
  CurrencyInfo(abbreviation: 'ZAR', symbol: 'R', country: 'South Africa'),
  CurrencyInfo(abbreviation: 'RUB', symbol: '₽', country: 'Russia'),
  CurrencyInfo(abbreviation: 'SGD', symbol: 'S\$', country: 'Singapore'),
  CurrencyInfo(abbreviation: 'HKD', symbol: 'HK\$', country: 'Hong Kong'),
  CurrencyInfo(abbreviation: 'MXN', symbol: '\$', country: 'Mexico'),
  CurrencyInfo(abbreviation: 'TRY', symbol: '₺', country: 'Turkey'),
  CurrencyInfo(abbreviation: 'KRW', symbol: '₩', country: 'South Korea'),
  CurrencyInfo(abbreviation: 'UED', symbol: 'د.إ', country: 'United Arab Emirates'),
  CurrencyInfo(abbreviation: 'SAR', symbol: 'ر.س', country: 'Saudi Arabia'),
  CurrencyInfo(abbreviation: 'THB', symbol: '฿', country: 'Thailand'),
  CurrencyInfo(abbreviation: 'PLN', symbol: 'zł', country: 'Poland'),
  CurrencyInfo(abbreviation: 'MYR', symbol: 'RM', country: 'Malaysia'),
  CurrencyInfo(abbreviation: 'ILS', symbol: '₪', country: 'Israel'),
  CurrencyInfo(abbreviation: 'NOK', symbol: 'kr', country: 'Norway'),
  CurrencyInfo(abbreviation: 'DKK', symbol: 'kr', country: 'Denmark'),
  CurrencyInfo(abbreviation: 'HUF', symbol: 'Ft', country: 'Hungary'),
  CurrencyInfo(abbreviation: 'CZK', symbol: 'Kč', country: 'Czech Republic'),
  CurrencyInfo(abbreviation: 'IDR', symbol: 'Rp', country: 'Indonesia'),
  CurrencyInfo(abbreviation: 'PHP', symbol: '₱	', country: 'Philippines'),
  CurrencyInfo(abbreviation: 'EGP', symbol: 'ج.م', country: 'Egypt'),
  CurrencyInfo(abbreviation: 'VND', symbol: '₫', country: 'Vietnam'),
  CurrencyInfo(abbreviation: 'CLP', symbol: '\$', country: 'Chile'),
  CurrencyInfo(abbreviation: 'ARS', symbol: '\$', country: 'Argentina'),
  CurrencyInfo(abbreviation: 'COP', symbol: '\$', country: 'Colombia'),
  CurrencyInfo(abbreviation: 'PEN', symbol: 'S/', country: 'Peru'),
  CurrencyInfo(abbreviation: 'KWD', symbol: 'د.ك', country: 'Kuwait'),
  CurrencyInfo(abbreviation: 'OMR', symbol: 'ر.ع.', country: 'Oman'),
  CurrencyInfo(abbreviation: 'QAR', symbol: 'ر.ق', country: 'Qatar'),
  CurrencyInfo(abbreviation: 'BHD', symbol: '.د.ب', country: 'Bahrain'),
  CurrencyInfo(abbreviation: 'TWD', symbol: 'NT\$', country: 'Taiwan'),
  CurrencyInfo(abbreviation: 'MAD', symbol: 'د.م.', country: 'Morocco'),
  CurrencyInfo(abbreviation: 'PKR', symbol: '₨', country: 'Pakistan'),
  CurrencyInfo(abbreviation: 'BDT', symbol: '৳	', country: 'Bangladesh'),
  CurrencyInfo(abbreviation: 'LKR', symbol: 'Rs', country: 'Sri Lanka'),
  CurrencyInfo(abbreviation: 'BGN', symbol: 'лв', country: 'Bulgaria'),
  CurrencyInfo(abbreviation: 'RON', symbol: 'lei', country: 'Romania'),
  CurrencyInfo(abbreviation: 'HRK', symbol: 'kn', country: 'Croatia'),
  CurrencyInfo(abbreviation: 'UYU', symbol: '\$U', country: 'Uruguay'),
  CurrencyInfo(abbreviation: 'GHS', symbol: '¢', country: 'Ghana'),
  // Add more currencies as needed
];
