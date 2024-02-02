import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/login_screen.dart';
import 'package:firebaselogin/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebaselogin/auth_provider.dart' as MyAuthProvider;

import 'firebase_options.dart'; // Make sure to import your firebase_options.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Create an instance of AuthProvider here
  MyAuthProvider.AuthProvider authProvider = MyAuthProvider.AuthProvider();

  runApp(
    ChangeNotifierProvider<MyAuthProvider.AuthProvider>.value(
      value: authProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<MyAuthProvider.AuthProvider>(
        builder: (context, authProvider, child) {
          // Check if the user is authenticated
          if (authProvider.user != null) {
            // User is authenticated, navigate to the home screen
            // Replace HomeScreen with your actual home screen
            return const LoginScreen();
          } else {
            // User is not authenticated, show the login screen
            return const SignUpScreen();
          }
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome Home!'),
      ),
    );
  }
}
