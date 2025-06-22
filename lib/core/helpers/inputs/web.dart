import 'package:formz/formz.dart';

enum WebInputError { empty, format }

class WebInput extends FormzInput<String, WebInputError> {
  static final urlRegExp = RegExp(
    r'^(https?:\/\/)?'
    r'([\da-z\.-]+)\.([a-z\.]{2,6})'
    r'([\/\w \.-]*)*\/?$',
  );

  const WebInput.pure() : super.pure('');

  const WebInput.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == WebInputError.empty) return 'Web is required';
    if (displayError == WebInputError.format) return 'Invalid web format';

    return null;
  }

  @override
  WebInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return WebInputError.empty;
    if (!urlRegExp.hasMatch(value)) return WebInputError.format;

    return null;
  }
}
