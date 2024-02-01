import 'package:flutter/material.dart';
import 'package:firebaselogin/auth_provider.dart' as MyAuthProvider;
import 'package:provider/provider.dart';
import 'welcome.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SignUpForm(),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _handleSignUp(BuildContext context) async {
    // Get your AuthProvider instance using Provider
    final MyAuthProvider.AuthProvider authProvider =
        Provider.of<MyAuthProvider.AuthProvider>(context, listen: false);

    try {
      await authProvider.signUpWithEmailAndPassword(
        _emailController.text,
        _passController.text,
      );
      // Successfully signed up, you can navigate to another screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Welcome(),
        ),
      );
    } catch (e) {
      // Handle sign-up failure
      print("Error During Registration: $e");
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
                _handleSignUp(context);
              }
            },
            child: const Text("Sign Up"),
          )
        ]));
  }
}
