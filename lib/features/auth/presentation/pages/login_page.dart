import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/design/colors/app_colors.dart';
import '../controllers/auth_controller.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              
              // Logo e título
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.primaryButton,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(
                      Icons.location_on,
                      size: 60,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'NEUROMAP',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.primaryButton,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Inclusão Social para Pessoas com TEA',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              
              const SizedBox(height: 48),
              
              // Formulário de login
              Form(
                key: authController.loginFormKey,
                child: Column(
                  children: [
                    // Campo de email
                    TextFormField(
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: authController.validateEmail,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Digite seu email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Campo de senha
                    Obx(() => TextFormField(
                      controller: authController.passwordController,
                      obscureText: !authController.isPasswordVisible.value,
                      validator: authController.validatePassword,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            authController.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: authController.togglePasswordVisibility,
                        ),
                      ),
                    )),
                    
                    const SizedBox(height: 8),
                    
                    // Link "Esqueci a senha"
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.to(() => const ForgotPasswordPage()),
                        child: const Text('Esqueci a senha'),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Botão de login
                    Obx(() => SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: authController.isLoading.value
                            ? null
                            : authController.login,
                        child: authController.isLoading.value
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : const Text('ENTRAR'),
                      ),
                    )),
                    
                    const SizedBox(height: 24),
                    
                    // Divisor
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'ou',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Botão de cadastro
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () => Get.to(() => const RegisterPage()),
                        child: const Text('NÃO TENHO CADASTRO'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

