import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

/// Provides Google Sign-In functionality for the API.
///
/// The [APIGoogle] class provides methods for signing in and out with Google,
/// retrieving user information, and managing the Google Sign-In session.
class APIGoogle {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Signs in with Google and returns the [GoogleSignInAccount].
  ///
  /// This method initiates the Google Sign-In process and returns the [GoogleSignInAccount]
  /// of the signed-in user. It logs the sign-in process for debugging purposes.
  static Future<GoogleSignInAccount?> signIn() async {
    log(name: 'APIGoogle', 'Signing in with Google');
    return await _googleSignIn.signIn();
  }

  /// Signs out from Google.
  ///
  /// This method signs out from the current Google session.
  /// It logs the sign-out process for debugging purposes.
  static Future<void> signOut() async {
    log(name: 'APIGoogle', 'Signing out from Google');
    await _googleSignIn.signOut();
  }

  /// Checks if a user is signed in with Google.
  ///
  /// This method returns a boolean indicating whether a user is currently signed in with Google.
  /// It logs the check process for debugging purposes.
  static Future<bool> isSignedIn() async {
    log(name: 'APIGoogle', 'Checking if user is signed in');
    return await _googleSignIn.isSignedIn();
  }

  /// Retrieves the current signed-in user.
  ///
  /// This method returns the [GoogleSignInAccount] of the current signed-in user.
  /// It logs the retrieval process for debugging purposes.
  static Future<GoogleSignInAccount?> getCurrentUser() async {
    log(name: 'APIGoogle', 'Getting current user');
    return _googleSignIn.currentUser;
  }

  /// Retrieves the access token of the current signed-in user.
  ///
  /// This method returns the access token of the current signed-in user.
  /// It logs the retrieval process for debugging purposes.
  static Future<String?> getAccessToken() async {
    log(name: 'APIGoogle', 'Getting access token');
    final GoogleSignInAccount? googleUser =
        await _googleSignIn.signInSilently();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    return googleAuth.accessToken;
  }

  /// Retrieves the ID token of the current signed-in user.
  ///
  /// This method returns the ID token of the current signed-in user.
  /// It logs the retrieval process for debugging purposes.
  static Future<String?> getIdToken() async {
    final GoogleSignInAccount? googleUser =
        await _googleSignIn.signInSilently();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    return googleAuth.idToken;
  }

  /// Retrieves the email of the current signed-in user.
  ///
  /// This method returns the email of the current signed-in user.
  static Future<String?> getEmail() async {
    final GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    return googleUser!.email;
  }

  /// Retrieves the display name of the current signed-in user.
  ///
  /// This method returns the display name of the current signed-in user.
  static Future<String?> getDisplayName() async {
    final GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    return googleUser!.displayName;
  }

  /// Retrieves the photo URL of the current signed-in user.
  ///
  /// This method returns the photo URL of the current signed-in user.
  static Future<String?> getPhotoUrl() async {
    final GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    return googleUser!.photoUrl;
  }

  /// Retrieves the ID of the current signed-in user.
  ///
  /// This method returns the ID of the current signed-in user.
  static Future<String?> getId() async {
    final GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    return googleUser!.id;
  }

  /// Disconnects the current Google session.
  ///
  /// This method disconnects the current Google session.
  static Future<void> disconnect() async {
    await _googleSignIn.disconnect();
  }
}
