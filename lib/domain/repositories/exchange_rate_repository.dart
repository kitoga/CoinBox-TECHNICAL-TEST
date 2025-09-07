import 'package:fpdart/fpdart.dart';
import '../entities/exchange_rate_entity.dart';
import '../failures/failures.dart';

abstract class ExchangeRateRepository {
  Future<Either<Failure, ExchangeRateEntity>> getExchangeRates(
    String baseCurrency,
  );
  Future<Either<Failure, double>> convertCurrency(
    String fromCurrency,
    String toCurrency,
    double amount,
  );
}
