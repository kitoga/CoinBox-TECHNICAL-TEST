class ExchangeRateEntity {
  final String baseCode;
  final String result;
  final DateTime? timeLastUpdateUtc; // Make nullable
  final DateTime? timeNextUpdateUtc; // Make nullable
  final Map<String, double> conversionRates;

  ExchangeRateEntity({
    required this.baseCode,
    required this.result,
    this.timeLastUpdateUtc, // Optional
    this.timeNextUpdateUtc, // Optional
    required this.conversionRates,
  });

  double convert(String fromCurrency, String toCurrency, double amount) {
    if (fromCurrency == baseCode) {
      return amount * (conversionRates[toCurrency] ?? 1);
    } else if (toCurrency == baseCode) {
      return amount / (conversionRates[fromCurrency] ?? 1);
    } else {
      // Convert from source currency to base, then to target currency
      final amountInBase = amount / (conversionRates[fromCurrency] ?? 1);
      return amountInBase * (conversionRates[toCurrency] ?? 1);
    }
  }
}

class CountryEntity {
  final String name;
  final String code;
  final String emoji;
  final String dialCode;

  CountryEntity({
    required this.name,
    required this.code,
    required this.emoji,
    required this.dialCode,
  });

  @override
  String toString() {
    return 'CountryEntity{name: $name, code: $code, emoji: $emoji}';
  }
}
