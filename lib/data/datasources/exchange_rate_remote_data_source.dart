import 'dart:convert';

import 'package:converter/data/models/exchange_rate_model.dart';
import 'package:http/http.dart' as http;

abstract class ExchangeRateRemoteDataSource {
  Future<ExchangeRateModel> getExchangeRates(String baseCurrency);
}

class ExchangeRateRemoteDataSourceImpl implements ExchangeRateRemoteDataSource {
  final String apiKey;
  final http.Client client;
  final String baseUrl = 'https://v6.exchangerate-api.com/v6';

  ExchangeRateRemoteDataSourceImpl({
    required this.apiKey,
    required this.client,
  });

  @override
  Future<ExchangeRateModel> getExchangeRates(String baseCurrency) async {
    final url =
        'https://v6.exchangerate-api.com/v6/6d46bb8ffb18bb2300949c53/latest/$baseCurrency';
    print('🌐 API Call: $url');

    try {
      final response = await client
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'})
          .timeout(const Duration(seconds: 30));

      print('📡 API Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Debug: Check if we have the expected data
        print('✅ Result: ${data['result']}');
        print('✅ Base Code: ${data['base_code']}');
        print(
          '✅ Rates Count: ${data['conversion_rates'] != null ? (data['conversion_rates'] as Map).length : 0}',
        );

        // Try to parse with Freezed first
        try {
          final model = ExchangeRateModel.fromJson(data);
          print('🎉 Freezed parsing successful!');
          return model;
        } catch (e) {
          print('⚠️ Freezed parsing failed: $e');
          print('🔄 Falling back to manual parsing...');

          // Manual parsing as fallback
          return ExchangeRateModel(
            result: data['result'] as String? ?? 'unknown',
            documentation: data['documentation'] as String? ?? '',
            termsOfUse: data['terms_of_use'] as String? ?? '',
            timeLastUpdateUnix: data['time_last_update_unix'] as int? ?? 0,
            timeLastUpdateUtc: data['time_last_update_utc'] as String? ?? '',
            timeNextUpdateUnix: data['time_next_update_unix'] as int? ?? 0,
            timeNextUpdateUtc: data['time_next_update_utc'] as String? ?? '',
            baseCode: data['base_code'] as String? ?? 'USD',
            conversionRates: Map<String, double>.from(
              data['conversion_rates'] as Map<String, dynamic>? ?? {},
            ),
          );
        }
      } else {
        print('❌ API Error: ${response.statusCode} - ${response.body}');
        throw Exception(
          'Failed to load exchange rates: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('💥 Exception during API call: $e');
      rethrow;
    }
  }
}
