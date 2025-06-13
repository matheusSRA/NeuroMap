# Configuração do Firebase para NEUROMAP

## Passos Detalhados para Configuração

### 1. Criar Projeto no Firebase

1. Acesse [Firebase Console](https://console.firebase.google.com/)
2. Clique em "Adicionar projeto"
3. Digite o nome do projeto: "NEUROMAP"
4. Aceite os termos e continue
5. Configure o Google Analytics (opcional)
6. Clique em "Criar projeto"

### 2. Configurar Authentication

1. No painel do Firebase, clique em "Authentication"
2. Clique em "Começar"
3. Vá para a aba "Sign-in method"
4. Clique em "Email/senha"
5. Ative a opção "Ativar"
6. Clique em "Salvar"

### 3. Adicionar App Android

1. No painel principal, clique no ícone do Android
2. Preencha os campos:
   - **Nome do app Android**: NEUROMAP
   - **Nome do pacote Android**: `com.example.neuromap_app`
   - **SHA-1**: (opcional para desenvolvimento)
3. Clique em "Registrar app"
4. Baixe o arquivo `google-services.json`
5. Coloque o arquivo em `android/app/google-services.json`

### 4. Configurar Gradle (Android)

#### android/build.gradle
```gradle
buildscript {
    ext.kotlin_version = '1.7.10'
    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        classpath 'com.google.gms:google-services:4.3.15'
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
```

#### android/app/build.gradle
```gradle
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply plugin: 'dev.flutter.flutter-gradle-plugin'
apply plugin: 'com.google.gms.google-services'

android {
    namespace "com.example.neuromap_app"
    compileSdkVersion flutter.compileSdkVersion
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        applicationId "com.example.neuromap_app"
        minSdkVersion 21
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        multiDexEnabled true
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation 'com.android.support:multidex:1.0.3'
}
```

### 5. Adicionar App iOS (Opcional)

1. No painel principal, clique no ícone do iOS
2. Preencha os campos:
   - **Nome do app iOS**: NEUROMAP
   - **ID do pacote iOS**: `com.example.neuromapApp`
3. Clique em "Registrar app"
4. Baixe o arquivo `GoogleService-Info.plist`
5. Adicione o arquivo ao projeto iOS usando o Xcode

### 6. Configurar Firestore (Opcional)

1. No painel do Firebase, clique em "Firestore Database"
2. Clique em "Criar banco de dados"
3. Escolha "Começar no modo de teste"
4. Selecione a localização (preferencialmente próxima ao Brasil)
5. Clique em "Concluído"

### 7. Regras de Segurança Básicas

#### Authentication Rules
```javascript
// Permitir apenas usuários autenticados
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 8. Variáveis de Ambiente (Opcional)

Crie um arquivo `.env` na raiz do projeto:

```env
FIREBASE_PROJECT_ID=seu-projeto-id
FIREBASE_API_KEY=sua-api-key
FIREBASE_AUTH_DOMAIN=seu-projeto.firebaseapp.com
```

### 9. Verificação da Configuração

Execute os seguintes comandos para verificar se tudo está funcionando:

```bash
flutter clean
flutter pub get
flutter run
```

### 10. Teste de Autenticação

1. Execute o app
2. Tente criar uma nova conta
3. Verifique se o usuário aparece no console do Firebase
4. Teste o login com as credenciais criadas

## Troubleshooting

### Erro: "google-services.json not found"
- Certifique-se de que o arquivo está em `android/app/google-services.json`
- Verifique se o nome do arquivo está correto

### Erro: "Default FirebaseApp is not initialized"
- Verifique se `Firebase.initializeApp()` está sendo chamado no `main.dart`
- Certifique-se de que as dependências do Firebase estão instaladas

### Erro de Build Android
- Execute `flutter clean` e `flutter pub get`
- Verifique se as versões do Gradle estão corretas
- Certifique-se de que o `google-services` plugin está aplicado

### Erro de Permissões
- Verifique se as regras do Firestore permitem acesso
- Certifique-se de que o Authentication está configurado corretamente

## Comandos Úteis

```bash
# Limpar cache do Flutter
flutter clean

# Reinstalar dependências
flutter pub get

# Verificar configuração
flutter doctor

# Executar em modo debug
flutter run

# Executar em modo release
flutter run --release

# Gerar APK
flutter build apk

# Verificar logs do Firebase
adb logcat | grep -i firebase
```

## Links Úteis

- [Firebase Console](https://console.firebase.google.com/)
- [Documentação Firebase Flutter](https://firebase.flutter.dev/)
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/)
- [Firebase Auth Documentation](https://firebase.flutter.dev/docs/auth/usage/)

