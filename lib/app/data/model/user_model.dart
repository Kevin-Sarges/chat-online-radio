import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_radio/app/domain/entity/user_entities.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String name,
    required String email,
    required String photoUrl,
  }) : super(
          id: id,
          name: name,
          email: email,
          photoUrl: photoUrl,
        );

  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      id: snapshot.id,
      name: data['name'] as String,
      email: data['email'] as String,
      photoUrl: data['photoUrl'] as String,
    );
  }

  Map<String, dynamic> fomrMap() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['photoUrl'] = photoUrl;

    return data;
  }

  static List<UserModel>? fromJsonList(List list) {
    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}
