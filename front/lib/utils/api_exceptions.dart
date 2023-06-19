/// Base class for API-related exceptions.
///
/// The [APIException] class is the base class for all exceptions related to API operations.
/// It implements the [Exception] interface and provides a [message] property to store
/// the error message associated with the exception.
class APIException implements Exception {
  final String message;

  /// Creates a new instance of [APIException] with the specified [message].
  APIException(this.message);

  @override
  String toString() => 'APIException: $message';
}

/// Exception thrown when the API request is unauthorized.
///
/// The [UnauthorizedException] class is a subclass of [APIException] and represents
/// an exception that occurs when an API request is unauthorized.
class UnauthorizedException extends APIException {
  /// Creates a new instance of [UnauthorizedException] with the specified [message].
  UnauthorizedException(String message) : super(message);

  @override
  String toString() => 'UnauthorizedException: $message';
}

/// Exception thrown when the API server encounters an error.
///
/// The [ServerErrorException] class is a subclass of [APIException] and represents
/// an exception that occurs when the API server encounters an error.
class ServerErrorException extends APIException {
  /// Creates a new instance of [ServerErrorException] with the specified [message].
  ServerErrorException(String message) : super(message);

  @override
  String toString() => 'ServerErrorException: $message';
}

/// Exception thrown when the API request is invalid.
///
/// The [BadRequestException] class is a subclass of [APIException] and represents
/// an exception that occurs when an API request is invalid.
class BadRequestException extends APIException {
  /// Creates a new instance of [BadRequestException] with the specified [message].
  BadRequestException(String message) : super(message);

  @override
  String toString() => 'BadRequestException: $message';
}

/// Exception thrown when the requested resource is not found.
///
/// The [NotFoundException] class is a subclass of [APIException] and represents
/// an exception that occurs when the requested resource is not found.
class NotFoundException extends APIException {
  /// Creates a new instance of [NotFoundException] with the specified [message].
  NotFoundException(String message) : super(message);

  @override
  String toString() => 'NotFoundException: $message';
}

/// Exception thrown when the API request is forbidden.
///
/// The [ForbiddenException] class is a subclass of [APIException] and represents
/// an exception that occurs when an API request is forbidden.
class ForbiddenException extends APIException {
  /// Creates a new instance of [ForbiddenException] with the specified [message].
  ForbiddenException(String message) : super(message);

  @override
  String toString() => 'ForbiddenException: $message';
}

/// Exception thrown when an unknown error occurs during the API request.
///
/// The [UnknownException] class is a subclass of [APIException] and represents
/// an exception that occurs when an unknown error occurs during the API request.
class UnknownException extends APIException {
  /// Creates a new instance of [UnknownException] with the specified [message].
  UnknownException(String message) : super(message);

  @override
  String toString() => 'UnknownException: $message';
}

/// Exception thrown when there is no internet connection.
///
/// The [NoInternetException] class is a subclass of [APIException] and represents
/// an exception that occurs when there is no internet connection.
class NoInternetException extends APIException {
  /// Creates a new instance of [NoInternetException] with the specified [message].
  NoInternetException(String message) : super(message);

  @override
  String toString() => 'NoInternetException: $message';
}

/// Exception thrown when the API request times out.
///
/// The [TimeOutException] class is a subclass of [APIException] and represents
/// an exception that occurs when the API request times out.
class TimeOutException extends APIException {
  /// Creates a new instance of [TimeOutException] with the specified [message].
  TimeOutException(String message) : super(message);

  @override
  String toString() => 'TimeOutException: $message';
}