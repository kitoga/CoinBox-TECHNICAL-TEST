import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/exchange_rate_entity.dart';

part 'exchange_rate_model.freezed.dart';
part 'exchange_rate_model.g.dart';

@freezed
class ExchangeRateModel with _$ExchangeRateModel {
  const factory ExchangeRateModel({
    required String result,
    required String documentation,
    @JsonKey(name: 'terms_of_use') required String termsOfUse,
    @JsonKey(name: 'time_last_update_unix') required int timeLastUpdateUnix,
    @JsonKey(name: 'time_last_update_utc') required String timeLastUpdateUtc,
    @JsonKey(name: 'time_next_update_unix') required int timeNextUpdateUnix,
    @JsonKey(name: 'time_next_update_utc') required String timeNextUpdateUtc,
    @JsonKey(name: 'base_code') required String baseCode,
    @JsonKey(name: 'conversion_rates')
    required Map<String, double> conversionRates,
  }) = _ExchangeRateModel;

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateModelFromJson(json);
}

extension ExchangeRateModelX on ExchangeRateModel {
  ExchangeRateEntity toEntity() {
    return ExchangeRateEntity(
      baseCode: baseCode,
      result: result,
      timeLastUpdateUtc: _parseDate(timeLastUpdateUtc),
      timeNextUpdateUtc: _parseDate(timeNextUpdateUtc),
      conversionRates: conversionRates,
    );
  }

  DateTime _parseDate(String dateString) {
    try {
      // Handle the format: "Sun, 07 Sep 2025 00:00:01 +0000"
      // Remove the day name and timezone offset for parsing
      final parts = dateString.split(' ');
      if (parts.length >= 5) {
        // Reconstruct without day name and timezone
        final parsedDate = '${parts[1]} ${parts[2]} ${parts[3]} ${parts[4]}';
        return DateTime.parse(parsedDate);
      }
      // Fallback to trying direct parse
      return DateTime.parse(dateString);
    } catch (e) {
      print('⚠️ Date parsing failed for "$dateString": $e');
      // Return current date as fallback
      return DateTime.now();
    }
  }
}
