import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/design/colors/app_colors.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('NEUROMAP'),
        backgroundColor: AppColors.menu,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _showLogoutDialog(context, authController),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saudação
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryButton,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo ao NEUROMAP!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Encontre locais inclusivos para pessoas com TEA',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Seção de funcionalidades principais
            Text(
              'Funcionalidades',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Grid de funcionalidades
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildFeatureCard(
                  context,
                  icon: Icons.location_on,
                  title: 'Locais',
                  subtitle: 'Encontre locais inclusivos',
                  color: AppColors.primaryButton,
                  onTap: () => _showComingSoon(context),
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.map,
                  title: 'Mapa',
                  subtitle: 'Visualize no mapa',
                  color: AppColors.secondaryButton,
                  onTap: () => _showComingSoon(context),
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.person,
                  title: 'Perfil',
                  subtitle: 'Gerencie seu perfil',
                  color: AppColors.accentButton,
                  onTap: () => _showComingSoon(context),
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.settings,
                  title: 'Configurações',
                  subtitle: 'Ajustes do app',
                  color: AppColors.highlight,
                  onTap: () => _showComingSoon(context),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Seção de informações
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.primaryButton,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Sobre o NEUROMAP',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'O NEUROMAP é um aplicativo dedicado à inclusão social de pessoas com Transtorno do Espectro Autista (TEA). Nossa missão é mapear e conectar usuários a locais e estabelecimentos que oferecem acolhimento e infraestrutura adequada.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.menu,
        selectedItemColor: AppColors.primaryButton,
        unselectedItemColor: AppColors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Locais',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuração',
          ),
        ],
        onTap: (index) => _showComingSoon(context),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    Get.snackbar(
      'Em breve',
      'Esta funcionalidade estará disponível em breve!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryButton,
      colorText: AppColors.white,
    );
  }

  void _showLogoutDialog(BuildContext context, AuthController authController) {
    Get.dialog(
      AlertDialog(
        title: const Text('Sair'),
        content: const Text('Tem certeza que deseja sair?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              authController.logout();
            },
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}

