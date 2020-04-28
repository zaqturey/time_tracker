abstract class StringValidator {
  bool isValid(String value);
}

// Below method returns TRUE if the passed in value is 'Not Empty' otherwise FALSE
class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String emptyEmailErrorText = 'Email can\'t be empty';
  final String emptyPasswordErrorText = 'Password can\'t be empty';
}