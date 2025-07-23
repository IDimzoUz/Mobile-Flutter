import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
