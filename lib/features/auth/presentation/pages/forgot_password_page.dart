import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/design/colors/app_colors.dart';
import '../controllers/auth_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
        backgroundColor: AppColors.menu,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              
              // Ícone
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.secondaryButton.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.lock_reset,
                  size: 40,
                  color: AppColors.secondaryButton,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Título
              Text(
                'Esqueceu sua senha?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryButton,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              Text(
                'Digite seu email e enviaremos um link para redefinir sua senha.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 48),
              
              // Formulário
              Form(
                key: authController.forgotPasswordFormKey,
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
                    
                    const SizedBox(height: 32),
                    
                    // Botão de enviar
                    Obx(() => SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: authController.isLoading.value
                            ? null
                            : authController.forgotPassword,
                        child: authController.isLoading.value
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : const Text('ENVIAR EMAIL'),
                      ),
                    )),
                    
                    const SizedBox(height: 24),
                    
                    // Link para voltar ao login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lembrou da senha? ',
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

