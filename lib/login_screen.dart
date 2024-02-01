import 'package:firebaselogin/auth_provider.dart'
    as MyAuthProvider; // Alias for your custom AuthProvider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Consumer<MyAuthProvider.AuthProvider>(
        builder: (context, authProvider, child) {
          // Build your login UI here using authProvider
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: LoginForm(),
            ),
          );
        },
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _handleLogin(BuildContext context) async {
    // Get your AuthProvider instance using Provider
    final MyAuthProvider.AuthProvider authProvider =
        Provider.of<MyAuthProvider.AuthProvider>(context, listen: false);

    try {
      await authProvider.signUpWithEmailAndPassword(
        _emailController.text,
        _passController.text,
      );
      // Successfully logged in, you can navigate to another screen
    } catch (e) {
      // Handle login failure
      print("Error During Login: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Your Password";
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _handleLogin(context);
              }
            },
            child: const Text("Login"),
          )
        ]));
  }
}
