import 'package:formz/formz.dart';

enum NumberInputError { empty, numberFormat, indicative }

class NumberInput extends FormzInput<String, NumberInputError> {
  static final plusPrefixRegex = RegExp(r'^\+');
  static final numericRegex = RegExp(r'^\+\d+$');

  const NumberInput.pure() : super.pure('');

  const NumberInput.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NumberInputError.empty) return 'Number is required';
    if (displayError == NumberInputError.numberFormat) {
      return 'Invalid number format';
    }
    if (displayError == NumberInputError.indicative) {
      return 'Indicative number is required ex: +1, +34';
    }

    return null;
  }

  @override
  NumberInputError? validator(String value) {
    if (value.isEmpty) return NumberInputError.empty;

    if (!plusPrefixRegex.hasMatch(value)) {
      return NumberInputError.indicative;
    }

    if (!numericRegex.hasMatch(value)) {
      return NumberInputError.numberFormat;
    }
    return null;
  }
}
