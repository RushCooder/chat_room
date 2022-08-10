import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // initializing FirebaseAuth
  static final _auth = FirebaseAuth.instance;
  // this method will return current signed in user
  static User? get user => _auth.currentUser;

  // sign in user with email and password. If signed in successful then will return true otherwise false
  static Future<bool> signIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user != null;
  }

  // sign up user with email and password. If signed up successful then will return true otherwise false
  static Future<bool> signUp(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user != null;
  }

  // sign out the current user
  static Future<void> signOut()=> _auth.signOut();

  // this method will return verify status of email
  static bool isEmailVerified () => _auth.currentUser!.emailVerified;

  // this method will send verification email to current user
  static Future<void> sendVerificationEmail()=> _auth.currentUser!.sendEmailVerification();

}
