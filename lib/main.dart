import 'package:apex/core/router/app_router.dart';
import 'package:apex/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:apex/features/auth/data/services/firebase_auth_service.dart';
import 'package:apex/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:apex/features/auth/presentation/bloc/auth_event.dart';
import 'package:apex/firebase_options.dart';
// import 'package:apex/pages/home_page.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'pages/login_page.dart';
// import 'pages/pages/home_page.dart';

// ==============================
// Fonction principale de l'application
// ==============================

Future<void> main() async {
  // Permet d'initialiser Flutter avant Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation Firebase
  await Firebase.initializeApp(
    // Configuration automatique selon Android / iOS / Web
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Lancement de l'application
  runApp(const MyApp());
}

// ==============================
// Widget principal
// ==============================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepositoryImpl = AuthRepositoryImpl(FirebaseAuthService());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(authRepositoryImpl)..add(AuthInitialEvent())),
      ],
      child: MaterialApp.router(
        // Nom application
        title: 'LeloHub',
      
        // Theme global application
        theme: ThemeData(
          // Génère automatiquement les couleurs
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig:appRouter,
      
      ),
    );
  }
}
