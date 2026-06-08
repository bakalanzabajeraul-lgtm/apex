import '../entites/auth_user.dart';

abstract class AuthRepository {
  //creation de l'interface 
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password, String name);
  Future<void> signOut();

  Future<AuthUser?> getCurrentUser();
  Future<AuthUser?> signInWithGoogle();
}