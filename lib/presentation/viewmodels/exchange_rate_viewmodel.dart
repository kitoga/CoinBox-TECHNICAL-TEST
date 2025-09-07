import 'package:converter/core/services/country_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/exchange_rate_entity.dart';
import '../../domain/usecases/get_exchange_rates_usecase.dart';

class ExchangeRateState {
  final bool isLoading;
  final ExchangeRateEntity? exchangeRates;
  final String? error;
  final double convertedAmount;
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  final List<CountryEntity> countries; // ← Add this
  final CountryEntity? fromCountry; // ← Add this
  final CountryEntity? toCountry; // ← Add this

  ExchangeRateState({
    required this.isLoading,
    this.exchangeRates,
    this.error,
    this.convertedAmount = 0,
    this.fromCurrency = 'USD',
    this.toCurrency = 'EUR',
    this.amount = 1,
    required this.countries, // ← Add this
    this.fromCountry, // ← Add this
    this.toCountry, // ← Add this
  });

  ExchangeRateState.initial()
    : isLoading = false,
      exchangeRates = null,
      error = null,
      convertedAmount = 0,
      fromCurrency = 'USD',
      toCurrency = 'EUR',
      amount = 1,
      countries = [], // ← Initialize empty
      fromCountry = null,
      toCountry = null;

  // Update copyWith to include new fields
  ExchangeRateState copyWith({
    bool? isLoading,
    ExchangeRateEntity? exchangeRates,
    String? error,
    double? convertedAmount,
    String? fromCurrency,
    String? toCurrency,
    double? amount,
    List<CountryEntity>? countries,
    CountryEntity? fromCountry,
    CountryEntity? toCountry,
  }) {
    return ExchangeRateState(
      isLoading: isLoading ?? this.isLoading,
      exchangeRates: exchangeRates ?? this.exchangeRates,
      error: error ?? this.error,
      convertedAmount: convertedAmount ?? this.convertedAmount,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      amount: amount ?? this.amount,
      countries: countries ?? this.countries,
      fromCountry: fromCountry ?? this.fromCountry,
      toCountry: toCountry ?? this.toCountry,
    );
  }
}

class ExchangeRateViewModel extends StateNotifier<ExchangeRateState> {
  final GetExchangeRatesUseCase getExchangeRatesUseCase;
  final ConvertCurrencyUseCase convertCurrencyUseCase;

  ExchangeRateViewModel(
    this.getExchangeRatesUseCase,
    this.convertCurrencyUseCase,
  ) : super(ExchangeRateState.initial());

  Future<void> loadCountries() async {
    final countries = await CountryService.loadCountries();
    state = state.copyWith(
      countries: countries,
      fromCountry: CountryService.getCountryByCode(
        countries,
        state.fromCurrency,
      ),
      toCountry: CountryService.getCountryByCode(countries, state.toCurrency),
    );
  }

  @override
  Future<void> getExchangeRates(String baseCurrency) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await getExchangeRatesUseCase.execute(baseCurrency);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (rates) {
        state = state.copyWith(
          isLoading: false,
          exchangeRates: rates,
          error: null,
        );
      },
    );

    // Auto-convert after loading rates
    if (state.amount > 0) {
      await convertCurrency();
    }
  }

  Future<void> convertCurrency() async {
    if (state.amount <= 0) {
      state = state.copyWith(error: 'Amount must be greater than 0');
      return;
    }

    if (state.exchangeRates == null) {
      await getExchangeRates(state.fromCurrency);
      if (state.exchangeRates == null) {
        state = state.copyWith(error: 'Failed to load exchange rates');
        return;
      }
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final fromRate =
          state.exchangeRates!.conversionRates[state.fromCurrency] ?? 1.0;
      final toRate =
          state.exchangeRates!.conversionRates[state.toCurrency] ?? 1.0;
      final conversionRate = toRate / fromRate;
      final convertedAmount = state.amount * conversionRate;

      state = state.copyWith(
        isLoading: false,
        convertedAmount: convertedAmount,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Conversion failed: ${e.toString()}',
      );
    }
  }

  void setAmountFromString(String amountString) {
    try {
      final amount = double.tryParse(amountString) ?? 0;
      setAmount(amount);
    } catch (e) {
      setAmount(0);
    }
  }

  void setFromCurrency(String currency) {
    state = state.copyWith(fromCurrency: currency);
    // Auto-convert after changing currency
    if (state.amount > 0) {
      convertCurrency();
    }
  }

  void setToCurrency(String currency) {
    state = state.copyWith(toCurrency: currency);
    // Auto-convert after changing currency
    if (state.amount > 0) {
      convertCurrency();
    }
  }

  // void swapCurrencies() {
  //   final temp = state.fromCurrency;
  //   state = state.copyWith(fromCurrency: state.toCurrency, toCurrency: temp);
  //   // Auto-convert after swapping currencies
  //   if (state.amount > 0) {
  //     convertCurrency();
  //   }
  // }

  void setAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  void swapCurrencies() {
    final temp = state.fromCurrency;
    state = state.copyWith(fromCurrency: state.toCurrency, toCurrency: temp);
    // Auto-convert after swapping currencies
    if (state.amount > 0) {
      convertCurrency();
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
