import '../../core/validator_chain/validator.dart';
import '../../core/validator_chain/validator_model.dart';

class EmailValidator extends Validator {
  @override
  ValidatorModel isValid(model) {
    final String email = model.email;
    if (!email.contains("@")) {
      return ValidatorModel.invalid('Email informado é inválido');
    }
    return super.isValid(model);
  }
}
