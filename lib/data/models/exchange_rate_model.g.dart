// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeRateModelImpl _$$ExchangeRateModelImplFromJson(
  Map<String, dynamic> json,
) => _$ExchangeRateModelImpl(
  result: json['result'] as String,
  documentation: json['documentation'] as String,
  termsOfUse: json['terms_of_use'] as String,
  timeLastUpdateUnix: (json['time_last_update_unix'] as num).toInt(),
  timeLastUpdateUtc: json['time_last_update_utc'] as String,
  timeNextUpdateUnix: (json['time_next_update_unix'] as num).toInt(),
  timeNextUpdateUtc: json['time_next_update_utc'] as String,
  baseCode: json['base_code'] as String,
  conversionRates: (json['conversion_rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$$ExchangeRateModelImplToJson(
  _$ExchangeRateModelImpl instance,
) => <String, dynamic>{
  'result': instance.result,
  'documentation': instance.documentation,
  'terms_of_use': instance.termsOfUse,
  'time_last_update_unix': instance.timeLastUpdateUnix,
  'time_last_update_utc': instance.timeLastUpdateUtc,
  'time_next_update_unix': instance.timeNextUpdateUnix,
  'time_next_update_utc': instance.timeNextUpdateUtc,
  'base_code': instance.baseCode,
  'conversion_rates': instance.conversionRates,
};
