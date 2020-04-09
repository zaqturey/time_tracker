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

Feature Added -> 'signInWithFaceBook()'
- Pre-requisites for Android (refer UC-175, UC-182) >>
    -- 1. Registered as a FaceBook App on 'https://developers.facebook.com'
    -- 2. Follow steps from Section 4 i.e.  'Edit Your Resources and Manifest'
    -- 3. Add Android Package info (its present in 'AndroidManifest.xml') to section 5 i.e. 'Associate Your Package Name'
    -- 4. Add the HASH key for Android in section 6 i.e. 'Provide Development and Release Key Hashes'
    -- 5. Enabled Facebook as 'Sign-in method' on 'console.firebase.google.com'
    -- 6. Created Facebook 'Test Users' (from https://developers.facebook.com') i.e. navigating to 'Roles -> Test Users' - (refer UC-178)
- Pre-requisites for Android (refer UC-179, UC-182) >>
    -- Added the App's Bundle Identifier to 'https://developers.facebook.com' i.e. iOS -> Section 3a (Configure and Register your App with iOS)
    -- Update 'info.plist' by adding the snippet from 'https://developers.facebook.com' i.e. iOS -> Section 4 (Configure your project)
    -- In Xcode, '-ObjC' is added to the 'Other Linker Flags' under 'Build Settings' for root lever 'Runner' module.
- Strings.xml >> Add a new valid XML file i.e. 'strings.xml' in Android folder i.e. 'android/app/src/main/res/values/strings.xml'
- AndroidManifest.xml >> Add INTERNET permission.
- AndroidManifest.xml >> Copy and Add tags required for Facebook support i.e. '<meta-data>' and '<activity>'
- pubspec.yaml >> added 'flutter_facebook_login: ^2.0.1'
- auth.dart >> Added a new async method i.e. 'signInWithFacebook()' that returns a 'Future<User>'
- auth.dart >> Updated 'signOut()' to support sign out a Facebook User
- auth.dart >> Added Abstract method i.e. 'signInWithFacebook()' to 'AuthBase' class.
- sign_in_screen.dart >> Added a new method i.e. '_signInWithFacebook()' that will be called from the 'onPressed' of 'SocialSignInButton'.

