# time_tracker_flutter_course

A new flutter application for time tracking.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Commits History

# 'Email Sign in' Form - Implementing 'FocusNode' 
***email_sign_in_form.dart***
1. Added two new objects of 'FocusNode' class i.e. '_emailFocusNode' and '_passwordFocusNode'
2. For Email TextField, Added 'focusNode' property and assigned '_emailFocusNode' as its value.
3. For Password TextField, Added 'focusNode' property and assigned '_passwordFocusNode' as its value.
4. Added a new Void method i.e. '_emailEditingComplete()' that requests for '_passwordFocusNode'
5. For Email TextField, Added 'onEditingComplete' property and assigned '_emailEditingComplete' callback as its value.
6. For Password TextField, Added 'onEditingComplete' property and assigned '_submit' callback as its value.

# 'Email Sign in' Form - TextField Refactoring
***email_sign_in_form.dart***
1. Email TextField: Added 'autocorrect: false', 'TextInputType.emailAddress' and 'TextInputAction.next' properties.
2. Password TextField: Added 'TextInputAction.done' property.

# 'Email Sign in' Form - Popped/Removed
***email_sign_in_form.dart***
1. Popped/Removed the 'email_sign_in_form' upon the successful 'Sign in' or 'Create an account' operation.

# SignIn functionality (Support for 'SignInWithEmailAndPassword') - Continued
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


# Designing 'Card' Widget - Introducing and implementing 'Enum'
***email_sign_in_form.dart***
1. Created an Enum i.e. 'EmailSignInFormType' with two values i.e. 'signIn' and 'register'
2. Created a variable i.e. '_formType' of type 'EmailSignInFormType' and assigned it an initial value of 'EmailSignInFormType.signIn'.
3. Created two variables 'primaryText' and 'secondaryText' and used their values in Text fields of 'FormSubmitButton' and 'FlatButton'.
4. Created a new method i.e. '_toggleFormType' that call the 'setState' to update the value of '_formType' depending on the current value of 'EmailSignInFormType.signIn'
5. '_toggleFormType' method also clears out the text present in the '_emailController' and '_passwordController'

# Designing 'Card' Widget - Converting 'stl' to 'stf'
***email_sign_in_form.dart***
1. Changed 'EmailSignInForm' to 'StatefulWidget' as we are using the 'TextEditingController'

# Designing 'Card' Widget - Introducing 'TextEditingController'
***email_sign_in_form.dart***
1. Added two 'TextEditingController' i.e. '_emailController' and '_passwordController'
2. Updated 'Email' and 'Password 'TextField's by adding the above defined 'controller's i.e. '_emailController' and '_passwordController'
3. Added a new method i.e. '_submit' and updated 'onPressed' of 'FormSubmitButton' to call it that just prints the values in 'email' and 'password' TextFields

# Designing 'Card' Widget - Continued (replaced 'RaisedButton')
***form_submit_button.dart***
1. Added a new class i.e. 'FormSubmitButton' that extends 'CustomRaisedButton'

***email_sign_in_form.dart***
1. Replaced 'RaisedButton' with 'FormSubmitButton' for 'Sign In'.

# Designing 'Card' Widget - Continued (added Widgets to the List)
***email_sign_in_form.dart***
1. '_buildChildren()' now returns a List of 'TextField's (for Email and Password), a 'RaisedButton' (for 'Sign In') and a 'FlatButton' (for 'Register').
2. A 'SizedBox' is placed between each Widget of the List.

# Designing 'Card' Widget
***email_sign_in_form.dart***
1. Replaced 'Container' with a 'Column' Widget to place the Widgets vertically.
2. Set 'MainAxisSize.min' so Column length is limited to the length required by its Widgets.
3. 'children' widget call a method i.e. '_buildChildren()' that returns a 'List<Widget>'
4. Set 'CrossAxisAlignment.stretch' so all widgets inside the column can take full length.
5. Wrapped the 'Column' inside a 'Padding Widget'
6. Added a new method i.e. _buildChildren() that returns a 'List<Widget>' (currently its an Empty List)

# Introducing 'Card' Widget
1. email_sign_in_form.dart >> Added a new class i.e. 'EmailSignInForm'
2. email_sign_in_screen.dart >> Replaced '_buildContent()' with a 'Card' Widget that has 'EmailSignInForm()' as its Child.
3. email_sign_in_screen.dart >> Wrapped 'Card' Widget in a 'Padding' Widget.
4. email_sign_in_screen.dart >> Also removed declaration for '_buildContent()' Widget.


# SignInWithEmail
1. email_sign_in_screen.dart >> Added a new class i.e. 'EmailSignInScreen'
2. email_sign_in_screen.dart >> Returns a Scaffold that contains an and AppBar and an Empty Container.
3. sign_in_screen.dart >> Added a new method i.e. '_signInWithEmail()' that using 'Navigator.of' pushes a new screen i.e. 'EmailSignInScreen()'
4. sign_in_screen.dart >> 'onPressed' of SignInButton ('Sign in with Email') now calls the '_signInWithEmail(context)'
5. sign_in_screen.dart >> As context is needed to by '_signInWithEmail' method, the Context of 'build' widget is passed all the way to it.

# Feature Added -> 'signInWithFaceBook()'
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

