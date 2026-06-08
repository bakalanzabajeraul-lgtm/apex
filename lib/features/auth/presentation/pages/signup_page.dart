//import 'package:firebase_auth/firebase_auth.dart';
import 'package:apex/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController nomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //TextField(decoration: const InputDecoration(labelText: 'name')),
            TextField(
              controller: nomController,
              decoration: const InputDecoration(labelText: 'Nom')),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email')),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  AuthService().createUser(nomController.text, emailController.text, passwordController.text);
                });
              },
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      ),
    );
  }
}
