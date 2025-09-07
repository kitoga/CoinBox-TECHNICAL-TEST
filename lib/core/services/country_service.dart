import 'dart:convert';
import 'package:converter/domain/entities/exchange_rate_entity.dart';
import 'package:flutter/services.dart';

class CountryService {
  static Future<List<CountryEntity>> loadCountries() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'lib/core/data/countries_data.json',
      );
      final List<dynamic> jsonList = json.decode(jsonString);

      return jsonList
          .map(
            (json) => CountryEntity(
              name: json['name'] as String,
              code: json['code'] as String,
              emoji: json['emoji'] as String,
              dialCode: json['dial_code'] as String,
            ),
          )
          .toList();
    } catch (e) {
      print('Error loading countries: $e');
      return [];
    }
  }

  static CountryEntity? getCountryByCode(
    List<CountryEntity> countries,
    String currencyCode,
  ) {
    try {
      return countries.firstWhere(
        (country) => country.code == currencyCode,
        orElse: () => _getFallbackCountry(currencyCode),
      );
    } catch (e) {
      return _getFallbackCountry(currencyCode);
    }
  }

  static CountryEntity _getFallbackCountry(String currencyCode) {
    // Common currency to country mappings
    final commonMappings = {
      'USD': CountryEntity(
        name: 'United States',
        code: 'US',
        emoji: '🇺🇸',
        dialCode: '+1',
      ),
      'EUR': CountryEntity(
        name: 'European Union',
        code: 'EU',
        emoji: '🇪🇺',
        dialCode: '+',
      ),
      'GBP': CountryEntity(
        name: 'United Kingdom',
        code: 'GB',
        emoji: '🇬🇧',
        dialCode: '+44',
      ),
      'JPY': CountryEntity(
        name: 'Japan',
        code: 'JP',
        emoji: '🇯🇵',
        dialCode: '+81',
      ),
      'CAD': CountryEntity(
        name: 'Canada',
        code: 'CA',
        emoji: '🇨🇦',
        dialCode: '+1',
      ),
      'AUD': CountryEntity(
        name: 'Australia',
        code: 'AU',
        emoji: '🇦🇺',
        dialCode: '+61',
      ),
      'CHF': CountryEntity(
        name: 'Switzerland',
        code: 'CH',
        emoji: '🇨🇭',
        dialCode: '+41',
      ),
      'CNY': CountryEntity(
        name: 'China',
        code: 'CN',
        emoji: '🇨🇳',
        dialCode: '+86',
      ),
      'INR': CountryEntity(
        name: 'India',
        code: 'IN',
        emoji: '🇮🇳',
        dialCode: '+91',
      ),
      'SGD': CountryEntity(
        name: 'Singapore',
        code: 'SG',
        emoji: '🇸🇬',
        dialCode: '+65',
      ),
    };

    return commonMappings[currencyCode] ??
        CountryEntity(
          name: currencyCode,
          code: currencyCode,
          emoji: '🏳️',
          dialCode: '',
        );
  }
}
