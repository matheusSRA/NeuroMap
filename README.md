# NEUROMAP - Aplicativo para Inclusão Social de Pessoas com TEA

## Descrição

O NEUROMAP é um aplicativo móvel desenvolvido em Flutter que visa promover a inclusão social de pessoas com Transtorno do Espectro Autista (TEA). O aplicativo permite mapear e conectar usuários a locais e estabelecimentos que oferecem acolhimento e infraestrutura adequada para pessoas com TEA.

## Funcionalidades Implementadas

### Autenticação
- **Login com Email e Senha**: Autenticação segura usando Firebase Auth
- **Cadastro de Usuário**: Criação de novas contas com validação de dados
- **Recuperação de Senha**: Envio de email para redefinição de senha
- **Logout**: Saída segura da conta do usuário

### Interface
- **Tela de Login**: Interface intuitiva com campos de email e senha
- **Tela de Cadastro**: Formulário para criação de nova conta
- **Tela de Recuperação**: Interface para solicitar redefinição de senha
- **Tela Inicial**: Dashboard principal com funcionalidades do app
- **Design Responsivo**: Interface adaptada para diferentes tamanhos de tela

### Tecnologias Utilizadas
- **Flutter**: Framework para desenvolvimento multiplataforma
- **Firebase Auth**: Serviço de autenticação
- **GetX**: Gerenciamento de estado e navegação
- **Material Design**: Sistema de design do Google

## Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:

### 1. Flutter SDK
- **Versão mínima**: 3.4.3
- **Download**: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

### 2. Dart SDK
- **Versão**: Incluída com o Flutter SDK
- **Compatibilidade**: >=3.4.3 <4.0.0

### 3. Editor de Código
- **Recomendado**: Visual Studio Code ou Android Studio
- **Extensões necessárias**: Flutter e Dart

### 4. Emulador ou Dispositivo
- **Android**: Android Studio AVD ou dispositivo físico
- **iOS**: Xcode Simulator ou dispositivo físico (apenas no macOS)

## Configuração do Ambiente

### 1. Verificar Instalação do Flutter

```bash
flutter doctor
```

Este comando verifica se todas as dependências estão instaladas corretamente.

### 2. Clonar o Projeto

```bash
git clone <url-do-repositorio>
cd neuromap_app
```

### 3. Instalar Dependências

```bash
flutter pub get
```

### 4. Configurar Firebase

#### 4.1. Criar Projeto no Firebase Console
1. Acesse [https://console.firebase.google.com/](https://console.firebase.google.com/)
2. Clique em "Adicionar projeto"
3. Siga as instruções para criar um novo projeto

#### 4.2. Configurar Authentication
1. No console do Firebase, vá para "Authentication"
2. Clique em "Começar"
3. Na aba "Sign-in method", habilite "Email/senha"

#### 4.3. Adicionar App Android
1. No console do Firebase, clique no ícone do Android
2. Registre o app com o package name: `com.example.neuromap_app`
3. Baixe o arquivo `google-services.json`
4. Coloque o arquivo em `android/app/`

#### 4.4. Adicionar App iOS (se necessário)
1. No console do Firebase, clique no ícone do iOS
2. Registre o app com o bundle ID: `com.example.neuromapApp`
3. Baixe o arquivo `GoogleService-Info.plist`
4. Adicione o arquivo ao projeto iOS no Xcode

### 5. Configurar Dependências Android

Edite o arquivo `android/build.gradle`:

```gradle
buildscript {
    ext.kotlin_version = '1.7.10'
    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        classpath 'com.google.gms:google-services:4.3.15'
    }
}
```

Edite o arquivo `android/app/build.gradle`:

```gradle
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply plugin: 'dev.flutter.flutter-gradle-plugin'
apply plugin: 'com.google.gms.google-services'

android {
    compileSdkVersion 34
    
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
    }
}
```

## Como Executar o Projeto

### 1. Verificar Dispositivos Disponíveis

```bash
flutter devices
```

### 2. Executar em Modo Debug

```bash
flutter run
```

### 3. Executar em Dispositivo Específico

```bash
flutter run -d <device-id>
```

### 4. Executar em Modo Release

```bash
flutter run --release
```

## Estrutura do Projeto

```
lib/
├── core/
│   ├── design/
│   │   ├── colors/
│   │   │   └── app_colors.dart
│   │   └── themes/
│   │       └── app_theme.dart
│   ├── exceptions/
│   ├── http/
│   ├── injection/
│   ├── localstorage/
│   ├── services/
│   ├── utils/
│   └── validations/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   └── repositories/
│   │   │       └── auth_repository.dart
│   │   ├── domain/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   └── auth_controller.dart
│   │       └── pages/
│   │           ├── login_page.dart
│   │           ├── register_page.dart
│   │           └── forgot_password_page.dart
│   └── home/
│       └── presentation/
│           └── pages/
│               └── home_page.dart
└── main.dart
```

## Dependências Principais

### Produção
- **flutter**: SDK principal do Flutter
- **firebase_core**: ^3.6.0 - Core do Firebase
- **firebase_auth**: ^5.3.1 - Autenticação Firebase
- **cloud_firestore**: ^5.4.3 - Banco de dados Firestore
- **get**: ^4.6.6 - Gerenciamento de estado e navegação
- **dio**: ^5.7.0 - Cliente HTTP
- **get_it**: ^8.0.1 - Injeção de dependência
- **shared_preferences**: ^2.3.2 - Armazenamento local
- **flutter_secure_storage**: ^9.2.2 - Armazenamento seguro
- **intl**: ^0.19.0 - Internacionalização

### Desenvolvimento
- **flutter_test**: Testes unitários
- **flutter_lints**: ^3.0.0 - Análise de código

## Comandos Úteis

### Limpar Cache
```bash
flutter clean
flutter pub get
```

### Gerar APK
```bash
flutter build apk
```

### Gerar Bundle Android
```bash
flutter build appbundle
```

### Executar Testes
```bash
flutter test
```

### Analisar Código
```bash
flutter analyze
```

## Solução de Problemas Comuns

### 1. Erro de Gradle
Se encontrar erros relacionados ao Gradle:
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### 2. Erro de Firebase
Certifique-se de que:
- O arquivo `google-services.json` está em `android/app/`
- O package name no Firebase corresponde ao do projeto
- As dependências do Firebase estão atualizadas

### 3. Erro de Dependências
```bash
flutter pub deps
flutter pub upgrade
```

### 4. Erro de Versão do SDK
Verifique se a versão do Flutter está atualizada:
```bash
flutter upgrade
```

## Próximos Passos

### Funcionalidades Planejadas
1. **Mapeamento de Locais**: Integração com mapas para visualizar locais inclusivos
2. **Sistema de Avaliações**: Permitir que usuários avaliem locais
3. **Filtros Avançados**: Busca por tipo de estabelecimento e características
4. **Perfil de Usuário**: Gerenciamento de informações pessoais
5. **Notificações**: Alertas sobre novos locais e atualizações

### Melhorias Técnicas
1. **Testes Automatizados**: Implementar testes unitários e de integração
2. **CI/CD**: Configurar pipeline de integração contínua
3. **Offline Support**: Funcionalidades offline com sincronização
4. **Performance**: Otimizações de performance e carregamento
5. **Acessibilidade**: Melhorias para usuários com necessidades especiais

## Suporte

Para dúvidas ou problemas:
1. Verifique a documentação oficial do Flutter: [https://flutter.dev/docs](https://flutter.dev/docs)
2. Consulte a documentação do Firebase: [https://firebase.google.com/docs](https://firebase.google.com/docs)
3. Verifique os issues conhecidos no repositório do projeto

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---

**Desenvolvido com ❤️ para promover a inclusão social de pessoas com TEA**

