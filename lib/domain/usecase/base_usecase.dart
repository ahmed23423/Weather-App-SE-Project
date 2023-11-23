import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class BaseUseCaseOne<In, Out> {
  Future<Out> execute(In input);
}

abstract class BaseUseCaseTwo<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
