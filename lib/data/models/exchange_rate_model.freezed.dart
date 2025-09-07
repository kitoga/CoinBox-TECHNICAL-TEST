// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExchangeRateModel _$ExchangeRateModelFromJson(Map<String, dynamic> json) {
  return _ExchangeRateModel.fromJson(json);
}

/// @nodoc
mixin _$ExchangeRateModel {
  String get result => throw _privateConstructorUsedError;
  String get documentation => throw _privateConstructorUsedError;
  @JsonKey(name: 'terms_of_use')
  String get termsOfUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_last_update_unix')
  int get timeLastUpdateUnix => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_last_update_utc')
  String get timeLastUpdateUtc => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_next_update_unix')
  int get timeNextUpdateUnix => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_next_update_utc')
  String get timeNextUpdateUtc => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_code')
  String get baseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'conversion_rates')
  Map<String, double> get conversionRates => throw _privateConstructorUsedError;

  /// Serializes this ExchangeRateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExchangeRateModelCopyWith<ExchangeRateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeRateModelCopyWith<$Res> {
  factory $ExchangeRateModelCopyWith(
    ExchangeRateModel value,
    $Res Function(ExchangeRateModel) then,
  ) = _$ExchangeRateModelCopyWithImpl<$Res, ExchangeRateModel>;
  @useResult
  $Res call({
    String result,
    String documentation,
    @JsonKey(name: 'terms_of_use') String termsOfUse,
    @JsonKey(name: 'time_last_update_unix') int timeLastUpdateUnix,
    @JsonKey(name: 'time_last_update_utc') String timeLastUpdateUtc,
    @JsonKey(name: 'time_next_update_unix') int timeNextUpdateUnix,
    @JsonKey(name: 'time_next_update_utc') String timeNextUpdateUtc,
    @JsonKey(name: 'base_code') String baseCode,
    @JsonKey(name: 'conversion_rates') Map<String, double> conversionRates,
  });
}

/// @nodoc
class _$ExchangeRateModelCopyWithImpl<$Res, $Val extends ExchangeRateModel>
    implements $ExchangeRateModelCopyWith<$Res> {
  _$ExchangeRateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? documentation = null,
    Object? termsOfUse = null,
    Object? timeLastUpdateUnix = null,
    Object? timeLastUpdateUtc = null,
    Object? timeNextUpdateUnix = null,
    Object? timeNextUpdateUtc = null,
    Object? baseCode = null,
    Object? conversionRates = null,
  }) {
    return _then(
      _value.copyWith(
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as String,
            documentation: null == documentation
                ? _value.documentation
                : documentation // ignore: cast_nullable_to_non_nullable
                      as String,
            termsOfUse: null == termsOfUse
                ? _value.termsOfUse
                : termsOfUse // ignore: cast_nullable_to_non_nullable
                      as String,
            timeLastUpdateUnix: null == timeLastUpdateUnix
                ? _value.timeLastUpdateUnix
                : timeLastUpdateUnix // ignore: cast_nullable_to_non_nullable
                      as int,
            timeLastUpdateUtc: null == timeLastUpdateUtc
                ? _value.timeLastUpdateUtc
                : timeLastUpdateUtc // ignore: cast_nullable_to_non_nullable
                      as String,
            timeNextUpdateUnix: null == timeNextUpdateUnix
                ? _value.timeNextUpdateUnix
                : timeNextUpdateUnix // ignore: cast_nullable_to_non_nullable
                      as int,
            timeNextUpdateUtc: null == timeNextUpdateUtc
                ? _value.timeNextUpdateUtc
                : timeNextUpdateUtc // ignore: cast_nullable_to_non_nullable
                      as String,
            baseCode: null == baseCode
                ? _value.baseCode
                : baseCode // ignore: cast_nullable_to_non_nullable
                      as String,
            conversionRates: null == conversionRates
                ? _value.conversionRates
                : conversionRates // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExchangeRateModelImplCopyWith<$Res>
    implements $ExchangeRateModelCopyWith<$Res> {
  factory _$$ExchangeRateModelImplCopyWith(
    _$ExchangeRateModelImpl value,
    $Res Function(_$ExchangeRateModelImpl) then,
  ) = __$$ExchangeRateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String result,
    String documentation,
    @JsonKey(name: 'terms_of_use') String termsOfUse,
    @JsonKey(name: 'time_last_update_unix') int timeLastUpdateUnix,
    @JsonKey(name: 'time_last_update_utc') String timeLastUpdateUtc,
    @JsonKey(name: 'time_next_update_unix') int timeNextUpdateUnix,
    @JsonKey(name: 'time_next_update_utc') String timeNextUpdateUtc,
    @JsonKey(name: 'base_code') String baseCode,
    @JsonKey(name: 'conversion_rates') Map<String, double> conversionRates,
  });
}

/// @nodoc
class __$$ExchangeRateModelImplCopyWithImpl<$Res>
    extends _$ExchangeRateModelCopyWithImpl<$Res, _$ExchangeRateModelImpl>
    implements _$$ExchangeRateModelImplCopyWith<$Res> {
  __$$ExchangeRateModelImplCopyWithImpl(
    _$ExchangeRateModelImpl _value,
    $Res Function(_$ExchangeRateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? documentation = null,
    Object? termsOfUse = null,
    Object? timeLastUpdateUnix = null,
    Object? timeLastUpdateUtc = null,
    Object? timeNextUpdateUnix = null,
    Object? timeNextUpdateUtc = null,
    Object? baseCode = null,
    Object? conversionRates = null,
  }) {
    return _then(
      _$ExchangeRateModelImpl(
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String,
        documentation: null == documentation
            ? _value.documentation
            : documentation // ignore: cast_nullable_to_non_nullable
                  as String,
        termsOfUse: null == termsOfUse
            ? _value.termsOfUse
            : termsOfUse // ignore: cast_nullable_to_non_nullable
                  as String,
        timeLastUpdateUnix: null == timeLastUpdateUnix
            ? _value.timeLastUpdateUnix
            : timeLastUpdateUnix // ignore: cast_nullable_to_non_nullable
                  as int,
        timeLastUpdateUtc: null == timeLastUpdateUtc
            ? _value.timeLastUpdateUtc
            : timeLastUpdateUtc // ignore: cast_nullable_to_non_nullable
                  as String,
        timeNextUpdateUnix: null == timeNextUpdateUnix
            ? _value.timeNextUpdateUnix
            : timeNextUpdateUnix // ignore: cast_nullable_to_non_nullable
                  as int,
        timeNextUpdateUtc: null == timeNextUpdateUtc
            ? _value.timeNextUpdateUtc
            : timeNextUpdateUtc // ignore: cast_nullable_to_non_nullable
                  as String,
        baseCode: null == baseCode
            ? _value.baseCode
            : baseCode // ignore: cast_nullable_to_non_nullable
                  as String,
        conversionRates: null == conversionRates
            ? _value._conversionRates
            : conversionRates // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeRateModelImpl implements _ExchangeRateModel {
  const _$ExchangeRateModelImpl({
    required this.result,
    required this.documentation,
    @JsonKey(name: 'terms_of_use') required this.termsOfUse,
    @JsonKey(name: 'time_last_update_unix') required this.timeLastUpdateUnix,
    @JsonKey(name: 'time_last_update_utc') required this.timeLastUpdateUtc,
    @JsonKey(name: 'time_next_update_unix') required this.timeNextUpdateUnix,
    @JsonKey(name: 'time_next_update_utc') required this.timeNextUpdateUtc,
    @JsonKey(name: 'base_code') required this.baseCode,
    @JsonKey(name: 'conversion_rates')
    required final Map<String, double> conversionRates,
  }) : _conversionRates = conversionRates;

  factory _$ExchangeRateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeRateModelImplFromJson(json);

  @override
  final String result;
  @override
  final String documentation;
  @override
  @JsonKey(name: 'terms_of_use')
  final String termsOfUse;
  @override
  @JsonKey(name: 'time_last_update_unix')
  final int timeLastUpdateUnix;
  @override
  @JsonKey(name: 'time_last_update_utc')
  final String timeLastUpdateUtc;
  @override
  @JsonKey(name: 'time_next_update_unix')
  final int timeNextUpdateUnix;
  @override
  @JsonKey(name: 'time_next_update_utc')
  final String timeNextUpdateUtc;
  @override
  @JsonKey(name: 'base_code')
  final String baseCode;
  final Map<String, double> _conversionRates;
  @override
  @JsonKey(name: 'conversion_rates')
  Map<String, double> get conversionRates {
    if (_conversionRates is EqualUnmodifiableMapView) return _conversionRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_conversionRates);
  }

  @override
  String toString() {
    return 'ExchangeRateModel(result: $result, documentation: $documentation, termsOfUse: $termsOfUse, timeLastUpdateUnix: $timeLastUpdateUnix, timeLastUpdateUtc: $timeLastUpdateUtc, timeNextUpdateUnix: $timeNextUpdateUnix, timeNextUpdateUtc: $timeNextUpdateUtc, baseCode: $baseCode, conversionRates: $conversionRates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeRateModelImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.documentation, documentation) ||
                other.documentation == documentation) &&
            (identical(other.termsOfUse, termsOfUse) ||
                other.termsOfUse == termsOfUse) &&
            (identical(other.timeLastUpdateUnix, timeLastUpdateUnix) ||
                other.timeLastUpdateUnix == timeLastUpdateUnix) &&
            (identical(other.timeLastUpdateUtc, timeLastUpdateUtc) ||
                other.timeLastUpdateUtc == timeLastUpdateUtc) &&
            (identical(other.timeNextUpdateUnix, timeNextUpdateUnix) ||
                other.timeNextUpdateUnix == timeNextUpdateUnix) &&
            (identical(other.timeNextUpdateUtc, timeNextUpdateUtc) ||
                other.timeNextUpdateUtc == timeNextUpdateUtc) &&
            (identical(other.baseCode, baseCode) ||
                other.baseCode == baseCode) &&
            const DeepCollectionEquality().equals(
              other._conversionRates,
              _conversionRates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    result,
    documentation,
    termsOfUse,
    timeLastUpdateUnix,
    timeLastUpdateUtc,
    timeNextUpdateUnix,
    timeNextUpdateUtc,
    baseCode,
    const DeepCollectionEquality().hash(_conversionRates),
  );

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeRateModelImplCopyWith<_$ExchangeRateModelImpl> get copyWith =>
      __$$ExchangeRateModelImplCopyWithImpl<_$ExchangeRateModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeRateModelImplToJson(this);
  }
}

abstract class _ExchangeRateModel implements ExchangeRateModel {
  const factory _ExchangeRateModel({
    required final String result,
    required final String documentation,
    @JsonKey(name: 'terms_of_use') required final String termsOfUse,
    @JsonKey(name: 'time_last_update_unix')
    required final int timeLastUpdateUnix,
    @JsonKey(name: 'time_last_update_utc')
    required final String timeLastUpdateUtc,
    @JsonKey(name: 'time_next_update_unix')
    required final int timeNextUpdateUnix,
    @JsonKey(name: 'time_next_update_utc')
    required final String timeNextUpdateUtc,
    @JsonKey(name: 'base_code') required final String baseCode,
    @JsonKey(name: 'conversion_rates')
    required final Map<String, double> conversionRates,
  }) = _$ExchangeRateModelImpl;

  factory _ExchangeRateModel.fromJson(Map<String, dynamic> json) =
      _$ExchangeRateModelImpl.fromJson;

  @override
  String get result;
  @override
  String get documentation;
  @override
  @JsonKey(name: 'terms_of_use')
  String get termsOfUse;
  @override
  @JsonKey(name: 'time_last_update_unix')
  int get timeLastUpdateUnix;
  @override
  @JsonKey(name: 'time_last_update_utc')
  String get timeLastUpdateUtc;
  @override
  @JsonKey(name: 'time_next_update_unix')
  int get timeNextUpdateUnix;
  @override
  @JsonKey(name: 'time_next_update_utc')
  String get timeNextUpdateUtc;
  @override
  @JsonKey(name: 'base_code')
  String get baseCode;
  @override
  @JsonKey(name: 'conversion_rates')
  Map<String, double> get conversionRates;

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeRateModelImplCopyWith<_$ExchangeRateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
