// signup_service.dart

import 'package:firebase_auth/firebase_auth.dart';

class SignupService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signupUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Signup Failed";
    } catch (e) {
      return "Something went wrong";
    }
  }
}