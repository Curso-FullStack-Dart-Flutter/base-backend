import 'validator.dart';

class ValidatorChainBuilder {
  Validator? first;
  late Validator last;

  ValidatorChainBuilder add(Validator validator) {
    if (null == first) {
      first = validator;
      last = validator;
      return this;
    }
    last.setNextValidator(validator);
    last = validator;
    return this;
  }

  Validator? getFirst() => first;
}
