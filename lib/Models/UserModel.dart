import 'package:odc_hangman/Compounents/Const.dart';

class UserModel {
  String name = '';
  int score = 0;
  String id = '';
  UserModel({
    required this.id,
    required this.name,
    required this.score,
  });
  Map<String, dynamic> toJson() => {
        'name': name,
        'score': score,
        'id': id,
      };

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
    id = json['id'];
  }
}
