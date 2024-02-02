import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/signup_screen.dart';
import 'package:firebaselogin/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebaselogin/auth_provider.dart' as MyAuthProvider;

import 'firebase_options.dart'; // Make sure to import your firebase_options.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyAuthProvider.AuthProvider>(
      create: (_) => MyAuthProvider.AuthProvider(), // Create instance here
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<MyAuthProvider.AuthProvider>(
          builder: (context, authProvider, child) {
            // Check if the user is authenticated
            if (authProvider.user != null) {
              // User is authenticated, navigate to the dashboard screen
              return const Welcome();
            } else {
              // User is not authenticated, show the login screen
              return const SignUpScreen();
            }
          },
        ),
      ),
    );
  }
}
