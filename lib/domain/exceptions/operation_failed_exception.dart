class OperationFailedException implements Exception {
  final String? message;

  OperationFailedException([this.message]);

  @override
  String toString() => message ?? '';
}
