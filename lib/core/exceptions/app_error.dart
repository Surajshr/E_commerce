class AppError {
  final String message;
  final Exception? exception;

  AppError({
    required this.message,
    this.exception,
  });
}