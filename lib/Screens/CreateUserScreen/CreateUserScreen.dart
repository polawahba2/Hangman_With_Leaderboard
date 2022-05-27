import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odc_hangman/GameLogicFuncions/GameLogicFunctions.dart';
import 'package:odc_hangman/Screens/GameScree.dart/GameScreen.dart';

// Please guess the correct word to save my life

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'Please guess the correct word to save my life ',
                    style: TextStyle(
                      fontSize: 30,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Name',
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text != '') {
                      createUser(name: nameController.text);
                      getAllUsers().then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return GameScreen();
                          }),
                        );
                      });
                    } else {
                      showToast('you should enter valid name', Colors.red);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Create',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
