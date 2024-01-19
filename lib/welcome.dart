import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
 class Welcome extends StatefulWidget {
   const Welcome({super.key});
 
   @override
   State<Welcome> createState() => _WelcomeState();
 }
 
 class _WelcomeState extends State<Welcome> {
     final FirebaseAuth _auth = FirebaseAuth.instance;



   @override
   Widget build(BuildContext context) {
    String? _email = _auth.currentUser?.email;
     return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text ("Logged In With: $_email"),
            ],
          )
          
          ),
          )
          
     );
   }
 }