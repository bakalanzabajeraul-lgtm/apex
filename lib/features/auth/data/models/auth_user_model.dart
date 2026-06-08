
import '../../domain/entites/auth_user.dart';

class AuthUserModel extends AuthUser{
  AuthUserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.imageUrl,
  });


  Map<String, dynamic> toJson(){
    return {
      'id':id, 
      'email':email, 
      'name':name
      };
  }

  factory AuthUserModel.fromJson(Map<String,dynamic> json){
    return AuthUserModel(
      id: json['id'] ?? '', 
      email: json['email'] ?? '', 
      name: json['name'] ?? '', 
      imageUrl: json['imageUrl'] ?? '', 

      );
  }

}