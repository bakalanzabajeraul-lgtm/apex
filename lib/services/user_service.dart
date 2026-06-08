
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/app_user.dart';

class UserService {

  //initialisation de la base de donnees
  final database = FirebaseFirestore.instance;


  //creer un uttilisateur
  Future<void> createUser(AppUser user) async{
    await database.collection('users').doc(user.uid).set(user.toJson());
  }


  //recuperer un utilisateur
  Future<AppUser?> getUser(String uid) async{
    final doc = await database.collection('users').doc(uid).get();
    if(doc.exists){
      return AppUser.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }


  //recuperer tous les utilisateurs
  Stream<List<AppUser>> get getAllUsers{
    final snapshot = database.collection('users').snapshots();
    return snapshot.map((doc){
      return doc.docs.map((event){
        return AppUser.fromJson(event.data());
      }).toList();
    });
    
  }

  
  //Mettre a jour un utilisateur
  Future<void> updateUser(AppUser user) async{
    await database.collection('users').doc(user.uid).update(user.toJson());
  }


   //supprimer un utilisateur
  Future<void> deleteUser(String uid) async{
    await database.collection('users').doc(uid).delete();
  }
  
}