class ValidatorModel {
  final bool isValid;
  final String? getMessage;
  ValidatorModel({required this.getMessage, this.isValid = false});

  static ValidatorModel valid() =>
      ValidatorModel(getMessage: null, isValid: true);
  static ValidatorModel invalid(String msg) =>
      ValidatorModel(getMessage: msg, isValid: false);

  @override
  String toString() =>
      'ValidatorModel(isValid: $isValid, getMessage: $getMessage)';
}
