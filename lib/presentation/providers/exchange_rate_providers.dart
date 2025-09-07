import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;
import '../../data/datasources/exchange_rate_remote_data_source.dart';
import '../../data/repositories/exchange_rate_repository_impl.dart';
import '../../domain/usecases/get_exchange_rates_usecase.dart';
import '../viewmodels/exchange_rate_viewmodel.dart';

// Constants
const String exchangeRateApiKey = '6d46bb8ffb18bb2300949c53';

// Data Sources
final exchangeRateRemoteDataSourceProvider =
    Provider<ExchangeRateRemoteDataSource>((ref) {
      return ExchangeRateRemoteDataSourceImpl(
        apiKey: exchangeRateApiKey,
        client: http.Client(),
      );
    });

// final exchangeRateRemoteDataSourceProvider =
// Provider<ExchangeRateRemoteDataSource>((ref) {
//   return ExchangeRateRemoteDataSourceImpl(
//     apiKey:
//         const String.fromEnvironment('EXCHANGE_RATE_API_KEY') ??
//         dotenv.get('EXCHANGE_RATE_API_KEY'), // Fallback to .env
//     client: http.Client(),
//   );
// });

// Repositories
final exchangeRateRepositoryProvider = Provider<ExchangeRateRepositoryImpl>((
  ref,
) {
  return ExchangeRateRepositoryImpl(
    ref.read(exchangeRateRemoteDataSourceProvider),
  );
});

// Use Cases
final getExchangeRatesUseCaseProvider = Provider<GetExchangeRatesUseCase>((
  ref,
) {
  return GetExchangeRatesUseCase(ref.read(exchangeRateRepositoryProvider));
});

final convertCurrencyUseCaseProvider = Provider<ConvertCurrencyUseCase>((ref) {
  return ConvertCurrencyUseCase(ref.read(exchangeRateRepositoryProvider));
});

// ViewModels
final exchangeRateViewModelProvider =
    StateNotifierProvider<ExchangeRateViewModel, ExchangeRateState>(
      (ref) => ExchangeRateViewModel(
        ref.read(getExchangeRatesUseCaseProvider),
        ref.read(convertCurrencyUseCaseProvider),
      ),
    );
