import 'package:firebase_auth/firebase_auth.dart';

class RegisterService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } catch (e) {
      print("Erro ao fazer login: $e");
      return false;
    }
  }
}