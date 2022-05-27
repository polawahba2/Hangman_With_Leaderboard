import 'package:flutter/material.dart';
import 'package:odc_hangman/GameLogicFuncions/GameLogicFunctions.dart';
import 'package:odc_hangman/Screens/GameScree.dart/GameScreen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
                width: double.infinity,
                child: Text(
                  'Please remember that every incorrect answer will hurt me',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                width: 250,
                child: Stack(
                  children: [
                    Image.asset('assets/images/head.png'),
                    Image.asset('assets/images/body.png'),
                    Image.asset('assets/images/la.png'),
                    Image.asset('assets/images/ll.png'),
                    Image.asset('assets/images/ra.png'),
                    Image.asset('assets/images/rl.png'),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  getAllUsers().then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return GameScreen();
                      }),
                    );
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Play',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
