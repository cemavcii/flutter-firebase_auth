import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testt/pages/home_page.dart';
import 'package:firebase_auth_testt/pages/logged_in_view.dart';
import 'package:firebase_auth_testt/services/firebase_auth_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const FirebaseAuthApp());
}

class FirebaseAuthApp extends StatelessWidget {
  const FirebaseAuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => FirebaseAuthManager(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<FirebaseAuthManager>().authStateChanges,
            initialData: null)
      ],
      child: MaterialApp(
        title: 'Firebase Auth Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          appBarTheme: const AppBarTheme(centerTitle: true),
        ),
        home: const AuthNavigator(),
      ),
    );
  }
}

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const LoggedInView();
    }
    return const HomeScreenView();
  }
}
