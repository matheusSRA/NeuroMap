import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  
  // Observables
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final Rx<User?> user = Rx<User?>(null);
  
  // Controllers dos campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  // Form keys
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Escutar mudanças no estado de autenticação
    _authRepository.authStateChanges.listen((User? user) {
      this.user.value = user;
      if (user != null) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/login');
      }
    });
    
    // Verificar se já existe um usuário logado
    user.value = _authRepository.currentUser;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Toggle visibilidade da senha
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Login
  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;
    
    isLoading.value = true;
    
    final result = await _authRepository.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    
    if (result != null) {
      Get.snackbar(
        'Sucesso',
        'Login realizado com sucesso!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearFields();
    }
    
    isLoading.value = false;
  }

  // Cadastro
  Future<void> register() async {
    if (!registerFormKey.currentState!.validate()) return;
    
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Erro',
        'As senhas não coincidem',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    
    isLoading.value = true;
    
    final result = await _authRepository.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    
    if (result != null) {
      Get.snackbar(
        'Sucesso',
        'Conta criada com sucesso!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearFields();
    }
    
    isLoading.value = false;
  }

  // Recuperar senha
  Future<void> forgotPassword() async {
    if (!forgotPasswordFormKey.currentState!.validate()) return;
    
    isLoading.value = true;
    
    final success = await _authRepository.sendPasswordResetEmail(
      email: emailController.text.trim(),
    );
    
    if (success) {
      clearFields();
      Get.back(); // Voltar para a tela de login
    }
    
    isLoading.value = false;
  }

  // Logout
  Future<void> logout() async {
    await _authRepository.signOut();
    clearFields();
  }

  // Limpar campos
  void clearFields() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  // Validadores
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email inválido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (value.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirmação de senha é obrigatória';
    }
    if (value != passwordController.text) {
      return 'Senhas não coincidem';
    }
    return null;
  }
}

