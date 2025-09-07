import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/exchange_rate_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/exchange_rate_repository.dart';
import '../datasources/exchange_rate_remote_data_source.dart';
import '../models/exchange_rate_model.dart';

class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  final ExchangeRateRemoteDataSource remoteDataSource;

  ExchangeRateRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ExchangeRateEntity>> getExchangeRates(
    String baseCurrency,
  ) async {
    try {
      final rates = await remoteDataSource.getExchangeRates(baseCurrency);
      return Right(rates.toEntity());
    } on http.ClientException catch (e) {
      return Left(NetworkFailure('Network error: ${e.message}'));
    } on Exception catch (e) {
      return Left(ServerFailure('Server error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, double>> convertCurrency(
    String fromCurrency,
    String toCurrency,
    double amount,
  ) async {
    try {
      final rates = await remoteDataSource.getExchangeRates(fromCurrency);
      final entity = rates.toEntity();
      final convertedAmount = entity.convert(fromCurrency, toCurrency, amount);
      return Right(convertedAmount);
    } on http.ClientException catch (e) {
      return Left(NetworkFailure('Network error: ${e.message}'));
    } on Exception catch (e) {
      return Left(ServerFailure('Server error: ${e.toString()}'));
    }
  }
}
