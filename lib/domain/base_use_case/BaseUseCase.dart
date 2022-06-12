abstract class BaseUseCase<Out, In> {
  Future<Out> perform(In);
}
