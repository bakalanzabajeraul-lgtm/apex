import 'package:apex/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:apex/features/auth/presentation/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthLoadingState){
          ScaffoldMessenger(child: SnackBar(content: Text("Une erreur c'est produite")));
        }
      },
      builder: (context, state) {
        if(state is AuthAuthenticatedState){
          return Scaffold(body: Center(child: Column(
            children: [
              SizedBox(height: 100,),
              CircleAvatar(
                radius: 50,
                backgroundImage: user?.photoURL != null?
                NetworkImage(user!.photoURL!) : null,
              ),
              Text(state.userId),
              
            ],
          )),);
        }


        if(state is AuthCheckConnectionState){
          return Scaffold(body: Center(child: Text("Connectez vous a l'internet")),);

        }
        return Scaffold(body: Center(child: CircularProgressIndicator(),),);
      },
    );
  }
}
