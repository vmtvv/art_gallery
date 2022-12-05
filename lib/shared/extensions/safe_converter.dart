extension NumExtensions on num? {
  num selfOrDefault() {
    return this ?? 0;
  }
}

extension IntExtensions on int? {
  int selfOrDefault() {
    return this ?? 0;
  }
}

extension StringExtensions on String? {
  String selfOrEmpty() {
    return this ?? '';
  }
}

extension DoubleExtension on double? {
  double selfOrDefault() {
    return this ?? 0;
  }
}
