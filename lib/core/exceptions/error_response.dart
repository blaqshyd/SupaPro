class ErrorResponse {
  final bool status;
  final String? msg;
  final StackTrace? stackTrace;
  ErrorResponse({
    this.status = false,
    this.msg,
    this.stackTrace,
  });
}
