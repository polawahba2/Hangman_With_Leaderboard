import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:odc_hangman/Compounents/Const.dart';
import 'package:odc_hangman/Models/UserModel.dart';

import '../PlayerStatusClass/PlayerStatusClass.dart';
import 'dart:math';

import '../Shared/CasheHelper.dart';

void newChallenge(bool userWin) {
  PlayerStatus.tries = 0;
  PlayerStatus.selectedCharacters = [];
  PlayerStatus.remainingTries = 6;
  PlayerStatus.remainingHints = 1;
  if (!userWin) PlayerStatus.playerStreak = 0;
}

String generateRandomWord() {
  Random random = Random();
  int randomNumber = random.nextInt(PlayerStatus.words.length - 1);
  String word = PlayerStatus.words[randomNumber].toUpperCase();
  print(PlayerStatus.words[randomNumber].toUpperCase());
  PlayerStatus.wordCopy = word;
  return word;
}

String giveMeHint(String word) {
  String availableCharactersToHint = word;
  PlayerStatus.selectedCharacters.forEach(
    (element) {
      if (word.contains(element.toUpperCase())) {
        availableCharactersToHint =
            availableCharactersToHint.replaceAll(element.toUpperCase(), '');
      }
    },
  );
  Random random = Random();
  if (availableCharactersToHint.length - 1 == 0) {
    return availableCharactersToHint[0];
  }
  int randomNumber = random.nextInt(availableCharactersToHint.length - 1);
  return availableCharactersToHint[randomNumber];
}

Future createUser({required String name}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();

  CashHelper.saveData(key: 'id', value: docUser.id);
  id = docUser.id;

  CashHelper.saveData(key: 'score', value: 0);

  final json = {
    'name': name,
    'score': 0,
    'id': docUser.id,
  };

  await docUser.set(json);
}

Future updateeUserScore({required int score}) async {
  await FirebaseFirestore.instance.collection('users').doc(id).update(
    {
      'score': score,
    },
  );
}

List<UserModel> allUsers = [];
UserModel? currentUserInfo;
UserModel? userModel;
Future getAllUsers() async {
  await FirebaseFirestore.instance
      .collection('users')
      .orderBy('score')
      .get()
      .then((value) {
    value.docs.forEach((element) {
      allUsers.add(UserModel.fromJson(element.data()));
      if (element.data()['id'] == id) {
        currentUserInfo = UserModel.fromJson(element.data());
      }
    });
  }).catchError((error) {
    print(error);
  });
}
