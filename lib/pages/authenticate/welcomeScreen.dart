import 'package:flutter/material.dart';
import 'package:musapp/components/button.dart';
import 'package:musapp/components/scrollableList.dart';
import 'package:musapp/pages/authenticate/Login.dart';
import 'package:musapp/pages/authenticate/Register.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget welcomeImg() {
    return FractionallySizedBox(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/wcover.png',
      ),
    );
  }

  Widget buttons() {
    return SizedBox(
      child: Column(
        children: [
          myButton(
              'Sign Up Free',
              const Color(0xff1ED760),
              Colors.black,
              Colors.transparent,
              (() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  )),
              337,
              50),
          const SizedBox(
            height: 12,
          ),
          myButton(
              'Continue with Google',
              Colors.transparent,
              Colors.white,
              Colors.white,
              (() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  )),
              337,
              50),
          const SizedBox(
            height: 12,
          ),
          myButton(
              'Log in',
              const Color.fromARGB(0, 0, 0, 0),
              Colors.white,
              Colors.transparent,
              (() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  )),
              337,
              50),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(child: welcomeImg()),
          Column(
            children: [
              Image.asset('assets/images/logo.png',
                  width: 50, height: 50, fit: BoxFit.fill),
              Container(
                width: 300,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Text(
                  'Millions of Songs. Free on Spotify.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              buttons(),
            ],
          ),
        ]),
      ),
    );
  }
}
