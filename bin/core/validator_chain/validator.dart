import 'validator_model.dart';

class Validator<T> {
  Validator? nextValidator;

  ValidatorModel isValid(T model) {
    if (this.nextValidator != null) {
      return this.nextValidator!.isValid(model);
    }
    return ValidatorModel.valid();
  }

  setNextValidator(validator) {
    this.nextValidator = validator;
  }
}
