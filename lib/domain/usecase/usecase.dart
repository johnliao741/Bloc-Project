
class VoidParams {
  const VoidParams._();

  static const param = VoidParams._();
}

abstract class UseCase<Param, T> {
  Future<T> call(Param param);
}