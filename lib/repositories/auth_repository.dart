import 'package:chron/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final LocalAuthentication _localAuth = LocalAuthentication();
  var hasUsedBiometrics = false;

  Future<bool> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      hasUsedBiometrics = true;
      return true;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  bool hasBiometrics() {
    return hasUsedBiometrics;
  }

  Future<bool> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      hasUsedBiometrics = true;
      return true;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<void> useBioMetrics() async {
    final bool canAuthenticateWithBiometrics =
        await _localAuth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
    if (!canAuthenticate) {
      hasUsedBiometrics = false;
      return;
    }
    final availableBiometrics = await _localAuth.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) {
      hasUsedBiometrics = false;
      return;
    }

    try {
      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to continue',
      );
      if (didAuthenticate) {
        hasUsedBiometrics = true;
        return;
      }
      hasUsedBiometrics = false;
      return;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(e);
        print(stacktrace);
      }
      hasUsedBiometrics = false;
      return;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      hasUsedBiometrics = false;
      return true;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<AppUser?> getCurrentUser() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      return null;
    }
    if (hasUsedBiometrics == false) {
      return null;
    }
    return AppUser(uid: currentUser.uid);
  }
}
