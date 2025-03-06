abstract class Usecase<Type, Prams> {
  Future<Type> call({required Prams params});
}
