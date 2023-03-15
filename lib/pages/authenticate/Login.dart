import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musapp/pages/home/home_page.dart';
import '../../components/button.dart';
import '../../services/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget title() {
    return const Text(
      'Login',
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget logo() {
    return Align(
      heightFactor: 2,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/Slogo.png',
        width: 170,
      ),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    // Color color,
    bool obscureText,
    Icon buttonIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 365,
            height: 51,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 119, 119, 119),
                hintText: title,
                hintStyle:
                    const TextStyle(color: Color.fromARGB(223, 234, 234, 234)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _errorMessage() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        errorMessage == '' ? '' : '$errorMessage',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  // Widget _submitButton() {
  //   return SizedBox(
  //     width: 320,
  //     height: 55,
  //     child: ElevatedButton(
  //       style: ButtonStyle(
  //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(90))),
  //           backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
  //       onPressed: () {
  //         createUserWithEmailAndPassword();
  //       },
  //       child: const Text('Register'),
  //     ),
  //   );
  // }

  Widget _loginOrRegisterButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 320,
        height: 55,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1A1C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: title(),
        leading: Container(
          child: const BackButton(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        // alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // logo(),
            _entryField(
              'Email',
              _controllerEmail,
              false,
              Icon(Icons.person_outline),
            ),
            _entryField(
              'Password',
              _controllerPassword,
              true,
              Icon(Icons.remove_red_eye_sharp),
            ),
            _errorMessage(),
            const Padding(padding: EdgeInsets.all(10)),

            myButton('Log in', Colors.white, Colors.black, Colors.transparent,
                (() => signInWithEmailAndPassword()), 150, 50),
          ],
        ),
      ),
    );
  }
}
