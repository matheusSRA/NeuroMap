import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Stream para monitorar mudanças no estado de autenticação
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Usuário atual
  User? get currentUser => _firebaseAuth.currentUser;

  // Login com email e senha
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      String message = 'Erro ao fazer login';
      
      switch (e.code) {
        case 'user-not-found':
          message = 'Usuário não encontrado';
          break;
        case 'wrong-password':
          message = 'Senha incorreta';
          break;
        case 'invalid-email':
          message = 'Email inválido';
          break;
        case 'user-disabled':
          message = 'Usuário desabilitado';
          break;
        case 'too-many-requests':
          message = 'Muitas tentativas. Tente novamente mais tarde';
          break;
        default:
          message = 'Erro: ${e.message}';
      }
      
      Get.snackbar(
        'Erro',
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro inesperado: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  // Cadastro com email e senha
  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      String message = 'Erro ao criar conta';
      
      switch (e.code) {
        case 'weak-password':
          message = 'A senha é muito fraca';
          break;
        case 'email-already-in-use':
          message = 'Este email já está em uso';
          break;
        case 'invalid-email':
          message = 'Email inválido';
          break;
        default:
          message = 'Erro: ${e.message}';
      }
      
      Get.snackbar(
        'Erro',
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro inesperado: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  // Recuperação de senha
  Future<bool> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Sucesso',
        'Email de recuperação enviado',
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      String message = 'Erro ao enviar email de recuperação';
      
      switch (e.code) {
        case 'user-not-found':
          message = 'Usuário não encontrado';
          break;
        case 'invalid-email':
          message = 'Email inválido';
          break;
        default:
          message = 'Erro: ${e.message}';
      }
      
      Get.snackbar(
        'Erro',
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro inesperado: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  // Logout
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro ao fazer logout: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

