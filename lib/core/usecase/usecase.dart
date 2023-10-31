abstract class UseCase<Type, Param, ParamSecond> {
  Future<Type> call(Param param, {ParamSecond? second});
}
