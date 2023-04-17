import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth extends Provider{
 final _firebaseAuth=FirebaseAuth.instance;
  Auth({required super.create});
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
 Future<UserCredential> signInWithFacebook() async {
   // Trigger the sign-in flow
   final LoginResult loginResult = await FacebookAuth.instance.login();

   // Create a credential from the access token
   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

   // Once signed in, return the UserCredential
   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
 }
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredentials;
    try {
      userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      rethrow;
    }
  }

 Future<User?> signInWithEmailAndPassword(
     String email, String password) async {
   final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
       email: email, password: password);
   return userCredentials.user;
 }
 Future<void> sendPasswordResetEmail(String email) async {
   await _firebaseAuth.sendPasswordResetEmail(email: email);
 }
}