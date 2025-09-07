import 'package:fpdart/fpdart.dart';
import '../entities/exchange_rate_entity.dart';
import '../failures/failures.dart';
import '../repositories/exchange_rate_repository.dart';

class GetExchangeRatesUseCase {
  final ExchangeRateRepository repository;

  GetExchangeRatesUseCase(this.repository);

  Future<Either<Failure, ExchangeRateEntity>> execute(
    String baseCurrency,
  ) async {
    if (baseCurrency.isEmpty) {
      return Left(ValidationFailure('Base currency cannot be empty'));
    }
    return await repository.getExchangeRates(baseCurrency);
  }
}

class ConvertCurrencyUseCase {
  final ExchangeRateRepository repository;

  ConvertCurrencyUseCase(this.repository);

  Future<Either<Failure, double>> execute(
    String fromCurrency,
    String toCurrency,
    double amount,
  ) async {
    if (fromCurrency.isEmpty || toCurrency.isEmpty) {
      return Left(ValidationFailure('Currencies cannot be empty'));
    }
    if (amount <= 0) {
      return Left(ValidationFailure('Amount must be greater than 0'));
    }
    return await repository.convertCurrency(fromCurrency, toCurrency, amount);
  }
}
