import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_radio/app/domain/entity/user_entities.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String name,
    required String email,
  }) : super(
          id: id,
          name: name,
          email: email,
        );

  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      id: snapshot.id,
      name: data['name'] as String,
      email: data['email'] as String,
    );
  }

  Map<String, dynamic> fomrMap() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['email'] = email;

    return data;
  }

  static List<UserModel>? fromJsonList(List list) {
    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}
