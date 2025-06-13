import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/design/colors/app_colors.dart';
import '../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        backgroundColor: AppColors.menu,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              
              // Título
              Text(
                'Cadastre-se no NEUROMAP',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryButton,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Crie sua conta para acessar locais inclusivos',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 48),
              
              // Formulário de cadastro
              Form(
                key: authController.registerFormKey,
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
                        hintText: 'Digite sua senha (mín. 6 caracteres)',
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
                    
                    const SizedBox(height: 16),
                    
                    // Campo de confirmação de senha
                    Obx(() => TextFormField(
                      controller: authController.confirmPasswordController,
                      obscureText: !authController.isPasswordVisible.value,
                      validator: authController.validateConfirmPassword,
                      decoration: const InputDecoration(
                        labelText: 'Confirmar Senha',
                        hintText: 'Digite novamente sua senha',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    )),
                    
                    const SizedBox(height: 32),
                    
                    // Botão de cadastro
                    Obx(() => SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: authController.isLoading.value
                            ? null
                            : authController.register,
                        child: authController.isLoading.value
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : const Text('CRIAR CONTA'),
                      ),
                    )),
                    
                    const SizedBox(height: 24),
                    
                    // Link para voltar ao login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já tem uma conta? ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Fazer login'),
                        ),
                      ],
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

