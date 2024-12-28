abstract class Failure {
  final String message;
  const Failure([this.message = 'Bir hata oluştu']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message]);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message]);
}
