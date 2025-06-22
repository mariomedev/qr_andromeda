import 'package:formz/formz.dart';

enum EmptyInputError { empty, format }

class EmptyInput extends FormzInput<String, EmptyInputError> {
  const EmptyInput.pure() : super.pure('');

  const EmptyInput.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmptyInputError.empty) return 'Data is required';

    return null;
  }

  @override
  EmptyInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmptyInputError.empty;

    return null;
  }
}
