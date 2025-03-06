abstract class Failure {
  Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class EmptyArgumentsFailure extends Failure {
  EmptyArgumentsFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}
