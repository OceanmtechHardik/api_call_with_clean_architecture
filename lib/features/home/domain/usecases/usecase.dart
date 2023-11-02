
import 'package:api_call_with_clean_architecture/features/home/domain/entities/app_errors.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
