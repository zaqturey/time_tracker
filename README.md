# time_tracker_flutter_course

A new flutter application for time tracking.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help to get started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Commits History

************************************************************************************************************************************************************************
### Added Sign-Out (logout) confirmation dialog i.e. an Alert Dialog (with 'Cancel' and 'Logout' Action)
========================================================================================================================================================================
***home_screen.dart***
1. _confirmSingOut -> New method has been added to perform the following i.e.
1.1. to Build and Display a 'PlatformAlertDialog' (with Alert Actions) 
1.2. Get the BOOL response from the selected/pressed 'Alert Action' and then assign it to a final variable i.e. 'isSignOutRequested'
1.3. Finally, call the '_signOut()' method if value for 'isSignOutRequested' is True.
2. onPressed -> Updated the 'onPressed' with 'confirmSingOut(context)' callback instead of '_signOut'


************************************************************************************************************************************************************************
### Added support for 'cancelActionText' (added to class constructor as an optional parameter) and refactoring
========================================================================================================================================================================
***platform_alert_dialog.dart***
1. cancelActionText -> added this final String variable to display the 'Cancel' text as 'dialog' Action (if passed)
2. _buildActions(context) -> Added this new function that returns a List<Widget> of Platform specific Dialog Actions.
3. Updated 'actions' property of 'buildCupertinoWidget' and 'buildMaterialWidget' to use '_buildActions(context)' as its value.

***platform_alert_dialog_action.dart***
1. PlatformAlertDialogAction -> This class accepts a 'Widget' and a 'VoidCallback', then build and return either a 'CupertinoDialogAction' or 'FlatButton'


************************************************************************************************************************************************************************
### replaced Generic 'showDialog' with Platform specific 'Dialog'
========================================================================================================================================================================
***platform_alert_dialog.dart***
1. Show -> Created this new async method that accepts the 'context' and returns the result from 'showCupertinoDialog<bool>' or 'showDialog<bool>' (depending on Platform) 
2. Note: 'Dialog' is the parent window for 'AlertDialog' and 'showCupertinoDialog' or 'showDialog' Build and Return a Platform specific 'AlertDialog' 

***email_sign_in_form.dart***
1. '_submit()' -> 'PlatformAlertDialog' -> Updated 'Catch' i.e. removed 'showDialog()' and instead directly call 'PlatformAlertDialog'.
2. '_submit()' -> 'show(context)' -> Calling 'show' on 'PlatformAlertDialog' inturn calls 'showDialog'/'showCupertinoDialog' from 'platform_alert_dialog.dart'


************************************************************************************************************************************************************************
### Implemented Platform independent 'Alert Dialogs' 
========================================================================================================================================================================
***platform_widget.dart***
1. 'PlatformWidget' -> Added this Abstract class to check the requesting Platform, and then build and return the requested Widgets
2. Note: as this is an Abstract class, the extending classes will override the Functions specific to each Platform i.e. 'buildCupertinoWidget' and 'buildMaterialWidget'

***platform_alert_dialog.dart***
1. As this class extends 'PlatformWidget', it implements 'buildCupertinoWidget' to Build and Return a 'CupertinoAlertDialog' 
2. Also, it implements 'buildMaterialWidget' to Build and Return an 'AlertDialog' 

***email_sign_in_form.dart***
1. '_submit()' -> Replaced the generic 'AlertDialog' with 'PlatformAlertDialog' (from 'platform_alert_dialog.dart') 


************************************************************************************************************************************************************************
### Added 'showDialog' that returns an 'AlertDialog'
========================================================================================================================================================================
***email_sign_in_form.dart***
1. '_submit()' -> Exception block now displays a 'showDialog' that returns an 'AlertDialog'


************************************************************************************************************************************************************************
### 'Email Sign in' Screen - Refactored (removed 'isToggleFormEnabled')
========================================================================================================================================================================
***email_sign_in_screen.dart***
1. Removed 'isToggleFormEnabled' variable
2. Updated 'onPressed' of 'FlatButton' (Toggle Form button) i.e. to use '!_isLoading' to call '_toggleFormType' or 'null' depending on its value.


************************************************************************************************************************************************************************
### 'Email Sign in' Screen - Fixing Vertical 'Overflow' error on small screens
========================================================================================================================================================================
***email_sign_in_screen.dart***
1. SingleChildScrollView: -> Wrapped the 'body' content/child (i.e. padding) into a 'SingleChildScrollView' widget to make the body contents vertically Scrollable.


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Updating 'Email' focus logic
========================================================================================================================================================================
***email_sign_in_form.dart***
1. Updated '_emailEditingComplete' i.e. Focus will only change from Email to Password TextField if the Email is valid i.e. NonEmpty.


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Disable form while an auth request is in progress.
========================================================================================================================================================================
***email_sign_in_form.dart***
1. Added a new bool variable '_isLoading' with default value of 'FALSE', it will be used to disable 'Sign in' and 'Toggle Form' button while an 'auth' request is in progress.
2. Updated 'submitEnabled' i.e. its this button will remain disabled (i.e. its value will remain FALSE) until value of  '_isLoading' is TRUE. 
3. Updated '_submit()' i.e. added '_isLoading = true' to its in initial (before auth request) 'setState()' call.
4. Updated '_submit()' i.e. added 'finally' to the try-catch and added '_isLoading = false' to the 'setState()' call in the 'finally' block.
5. Updated '_buildChildren' i.e. Added a new bool variable '_isLoading' with default value of 'FALSE'.
6. Updated 'onPressed' of 'FormSubmitButton' i.e. 'submitEnabled' to call '_submit' or 'null' depending on if its value is TRUE or FALSE.
7. Updated '_buildChildren()' i.e. added a new bool variable '_isToggleFormEnabled' its value is TRUE if there is no 'auth' request is in progress i.e. (!_isLoading).
8. Updated 'onPressed' of 'FlatButton' (Toggle Form button) i.e. 'isToggleFormEnabled' to call '_toggleFormType' or 'null' depending on if its value is TRUE or FALSE.


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Show Error text for email and password if 'Sign In' button is pressed once and '_email' and '_password' fields are empty
========================================================================================================================================================================
***string_validator.dart***
1. Added two String variables i.e. 'emptyEmailErrorText' and 'emptyPasswordErrorText' to standardized error texts. 

***email_sign_in_form.dart***
1. Added a new bool variable '_isSubmitted' with default value of 'false', will be used to check if 'Sign in' button pressed or not.
2. Updated '_submit()' method i.e. added 'setState()' to make '_isSubmitted' to 'true'
3. Updated '_toggleFormType()' method i.e. updated 'setState()' to make '_isSubmitted' to 'false'
4. Updated '_buildEmailTextField()' i.e. added a new bool 'showErrorText' will only be TRUE if 'Sign in' button is pressed and '_email' field is Empty
5. Added 'errorText' property to 'Email' TextField, that will display error text if 'showErrorText' is TRUE otherwise null.
6. Updated '_buildPasswordTextField()' i.e. added a new bool 'showErrorText' will only be TRUE if 'Sign in' button is pressed and '_password' field is Empty
7. Added 'errorText' property to 'Password' TextField, that will display error text if 'showErrorText' is TRUE otherwise null.


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Added a new file (and class) for String validation 
========================================================================================================================================================================
***string_validator.dart***
1. Added a new 'EmailAndPasswordValidators' class defines 'emailValidator' and 'passwordValidator' variables.  

***email_sign_in_form.dart***
1. MIXIN: 'EmailSignInForm' now Mixin with 'EmailAndPasswordValidators' class.
2. Refactored 'submitEnabled' to use 'emailValidator' (for '_email') and 'passwordValidator' (for '_password')


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Enable 'Sign In' button only after validation
========================================================================================================================================================================
***email_sign_in_form.dart***  
- Note:-
- In order to reflect the Widget changes, rebuild the Widget Tree by calling the 'setState()'
- 'onChanged' requires the input value parameter, but you can opt not to use/accept it in the called function.
1. Added a new boolean i.e. 'submitEnabled' that will be true when '_email' and '_password' fields are not empty.
2. Updated 'onPressed' callback of 'FormSubmitButton' to call '_submit' (when 'submitEnabled' is TRUE) otherwise call 'null'
3. Created a new void method i.e. '_updateState' that just rebuilds the Widget Tree by calling the 'setState()'
4. Added 'onChanged' property to 'Email' TextField that calls the '_updateState()' method.
5. Added 'onChanged' property to 'Password' TextField that also calls the '_updateState()' method.


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Extracted methods for 'Email' and 'Password' TextFields 
========================================================================================================================================================================
***email_sign_in_form.dart***
1. Extracted and replaced 'Email' TextField declaration to a new method i.e. '_buildEmailTextField()'
2. Extracted and replaced 'Password' TextField declaration to a new method i.e. '_buildPasswordTextField()'


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Implementing 'FocusNode' 
========================================================================================================================================================================
***email_sign_in_form.dart***
1. Added two new objects of 'FocusNode' class i.e. '_emailFocusNode' and '_passwordFocusNode'
2. For Email TextField, Added 'focusNode' property and assigned '_emailFocusNode' as its value.
3. For Password TextField, Added 'focusNode' property and assigned '_passwordFocusNode' as its value.
4. Added a new Void method i.e. '_emailEditingComplete()' that requests for '_passwordFocusNode'
5. For Email TextField, Added 'onEditingComplete' property and assigned '_emailEditingComplete' callback as its value.
6. For Password TextField, Added 'onEditingComplete' property and assigned '_submit' callback as its value.


************************************************************************************************************************************************************************
### 'Email Sign in' Form - TextField Refactoring
========================================================================================================================================================================
***email_sign_in_form.dart***
1. Email TextField: Added 'autocorrect: false', 'TextInputType.emailAddress' and 'TextInputAction.next' properties.
2. Password TextField: Added 'TextInputAction.done' property.


************************************************************************************************************************************************************************
### 'Email Sign in' Form - Popped/Removed
========================================================================================================================================================================
***email_sign_in_form.dart***
1. Popped/Removed the 'email_sign_in_form' upon the successful 'Sign in' or 'Create an account' operation.


************************************************************************************************************************************************************************
### SignIn functionality (Support for 'SignInWithEmailAndPassword') - Continued
========================================================================================================================================================================
***auth.dart***
1. Added two new Abstract methods in 'AuthBase' class i.e. 'createUserWithEmailAndPassword' and 'signInWithEmailAndPassword'
2. Overridden and implemented the above Abstract methods in the 'Auth' class which extends 'AuthBase' class.

***email_sign_in_form.dart***
1. Declared a new parameter of 'AuthBase' type i.e. 'auth'
2. Created a Constructor that accepts a @required 'auth' parameter.
3. Created Getters for 'email' and 'password' using '_emailController.text' and '_passwordController.text'
4. Implemented '_submit()' method to call Firebase methods depending on the 'Sign in' or 'Create an account'
5. Firebase Console >> Enabled 'Sign-in method' for 'Email/Password'

***email_sign_in_screen.dart***
Note: Since 'email_sign_in_form' requires 'auth' parameter, we have to pass it from the calling class i.e. 'EmailSignInScreen'
1. Declared a new parameter of 'AuthBase' type i.e. 'auth'
2. Created a Constructor that accepts a @required 'auth' parameter.
3. Passed in the 'auth' as an argument to the 'EmailSignInScreen' function.

***sign_in_screen.dart***
1. Updated '_signInWithEmail' i.e. by passing 'auth' argument to the 'EmailSignInScreen' callback


************************************************************************************************************************************************************************
### Designing 'Card' Widget - Introducing and implementing 'Enum'
========================================================================================================================================================================
***email_sign_in_form.dart***
1. Created an Enum i.e. 'EmailSignInFormType' with two values i.e. 'signIn' and 'register'
2. Created a variable i.e. '_formType' of type 'EmailSignInFormType' and assigned it an initial value of 'EmailSignInFormType.signIn'.
3. Created two variables 'primaryText' and 'secondaryText' and used their values in Text fields of 'FormSubmitButton' and 'FlatButton'.
4. Created a new method i.e. '_toggleFormType' that call the 'setState' to update the value of '_formType' depending on the current value of 'EmailSignInFormType.signIn'
5. '_toggleFormType' method also clears out the text present in the '_emailController' and '_passwordController'

### Designing 'Card' Widget - Converting 'stl' to 'stf'
***email_sign_in_form.dart***
1. Changed 'EmailSignInForm' to 'StatefulWidget' as we are using the 'TextEditingController'

### Designing 'Card' Widget - Introducing 'TextEditingController'
***email_sign_in_form.dart***
1. Added two 'TextEditingController' i.e. '_emailController' and '_passwordController'
2. Updated 'Email' and 'Password 'TextField's by adding the above defined 'controller's i.e. '_emailController' and '_passwordController'
3. Added a new method i.e. '_submit' and updated 'onPressed' of 'FormSubmitButton' to call it that just prints the values in 'email' and 'password' TextFields

### Designing 'Card' Widget - Continued (replaced 'RaisedButton')
***form_submit_button.dart***
1. Added a new class i.e. 'FormSubmitButton' that extends 'CustomRaisedButton'

***email_sign_in_form.dart***
1. Replaced 'RaisedButton' with 'FormSubmitButton' for 'Sign In'.

### Designing 'Card' Widget - Continued (added Widgets to the List)
***email_sign_in_form.dart***
1. '_buildChildren()' now returns a List of 'TextField's (for Email and Password), a 'RaisedButton' (for 'Sign In'), and a 'FlatButton' (for 'Register').
2. A 'SizedBox' is placed between each Widget of the List.

### Designing 'Card' Widget
***email_sign_in_form.dart***
1. Replaced 'Container' with a 'Column' Widget to place the Widgets vertically.
2. Set 'MainAxisSize.min' so Column length is limited to the length required by its Widgets.
3. 'children' widget call a method i.e. '_buildChildren()' that returns a 'List<Widget>'
4. Set 'CrossAxisAlignment.stretch' so all widgets inside the column can take full length.
5. Wrapped the 'Column' inside a 'Padding Widget'
6. Added a new method i.e. _buildChildren() that returns a 'List<Widget>' (currently its an Empty List)

### Introducing 'Card' Widget
1. email_sign_in_form.dart >> Added a new class i.e. 'EmailSignInForm'
2. email_sign_in_screen.dart >> Replaced '_buildContent()' with a 'Card' Widget that has 'EmailSignInForm()' as its Child.
3. email_sign_in_screen.dart >> Wrapped 'Card' Widget in a 'Padding' Widget.
4. email_sign_in_screen.dart >> Also removed declaration for '_buildContent()' Widget.


### SignInWithEmail
1. email_sign_in_screen.dart >> Added a new class i.e. 'EmailSignInScreen'
2. email_sign_in_screen.dart >> Returns a Scaffold that contains an and AppBar and an Empty Container.
3. sign_in_screen.dart >> Added a new method i.e. '_signInWithEmail()' that using 'Navigator.of' pushes a new screen i.e. 'EmailSignInScreen()'
4. sign_in_screen.dart >> 'onPressed' of SignInButton ('Sign in with Email') now calls the '_signInWithEmail(context)'
5. sign_in_screen.dart >> As context is needed by '_signInWithEmail' method, the Context of 'build' widget is passed all the way to it.

### Feature Added -> 'signInWithFaceBook()'
***Pre-requisites for Android (refer UC-175, UC-182) >>***
- Registered as a FaceBook App on 'https://developers.facebook.com'
- Follow steps from Section 4 i.e.  'Edit Your Resources and Manifest'
- Add Android Package info (its present in 'AndroidManifest.xml') to section 5 i.e. 'Associate Your Package Name'
- Add the HASH key for Android in section 6 i.e. 'Provide Development and Release Key Hashes'
- Enabled Facebook as 'Sign-in method' on 'console.firebase.google.com'
- Created Facebook 'Test Users' (from https://developers.facebook.com') i.e. navigating to 'Roles -> Test Users' - (refer UC-178)
***Pre-requisites for Android (refer UC-179, UC-182) >>***
- Added the App's Bundle Identifier to 'https://developers.facebook.com' i.e. iOS -> Section 3a (Configure and Register your App with iOS)
- Update 'info.plist' by adding the snippet from 'https://developers.facebook.com' i.e. iOS -> Section 4 (Configure your project)
- In Xcode, '-ObjC' is added to the 'Other Linker Flags' under 'Build Settings' for root lever 'Runner' module.
1. Strings.xml >> Add a new valid XML file i.e. 'strings.xml' in Android folder i.e. 'android/app/src/main/res/values/strings.xml'
2. AndroidManifest.xml >> Add INTERNET permission.
3. AndroidManifest.xml >> Copy and Add tags required for Facebook support i.e. '<meta-data>' and '<activity>'
4. pubspec.yaml >> added 'flutter_facebook_login: ^2.0.1'
5. auth.dart >> Added a new async method i.e. 'signInWithFacebook()' that returns a 'Future<User>'
6. auth.dart >> Updated 'signOut()' to support sign out a Facebook User
7. auth.dart >> Added Abstract method i.e. 'signInWithFacebook()' to 'AuthBase' class.
8. sign_in_screen.dart >> Added a new method i.e. '_signInWithFacebook()' that will be called from the 'onPressed' of 'SocialSignInButton'.

