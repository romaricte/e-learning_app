class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Une erreur serveur est survenue'});

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {}

class NetworkException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
