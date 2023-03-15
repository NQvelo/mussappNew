import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musapp/pages/home/home_page.dart';
import '../../components/button.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await auth().createUserWithEmailAndPassword(
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
      'Create account',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
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
                fillColor: Color.fromARGB(255, 119, 119, 119),
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
            _entryField('Email', _controllerEmail, false),
            _entryField('Password', _controllerPassword, true),
            _errorMessage(),
            const Padding(padding: EdgeInsets.all(10)),

            myButton(
                'Create account',
                Colors.white,
                Colors.black,
                Colors.transparent,
                (() => createUserWithEmailAndPassword()),
                150,
                50),
          ],
        ),
      ),
    );
  }
}
