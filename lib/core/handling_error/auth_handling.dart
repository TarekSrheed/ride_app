class AuthHandling {}


class DataFailed extends AuthHandling{
  final String message;

  DataFailed({required this.message});
}

class DataSuccess extends AuthHandling{}