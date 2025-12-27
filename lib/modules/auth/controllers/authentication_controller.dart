import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  Future<void> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return;

      final auth = await account.authentication;

      // Send auth.idToken to backend
      // POST /auth/google

      // Backend decides:
      // - existing user → home
      // - new user → complete profile screen

      print(auth);

    } catch (e) {
      Get.snackbar("Error", "Google sign-in failed");
    }
  }
}
