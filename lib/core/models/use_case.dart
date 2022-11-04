abstract class UseCase<T, Params> {
  Future<dynamic> call(Params params);
}