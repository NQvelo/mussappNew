import 'package:flutter/material.dart';
import 'package:musapp/components/button.dart';
import 'package:musapp/pages/authenticate/Login.dart';
import 'package:musapp/pages/authenticate/Register.dart';
import 'package:musapp/pages/authenticate/login_or_signIn.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);
  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
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
              337),
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
              337),
          const SizedBox(
            height: 12,
          ),
          myButton(
              'Log in',
              Color.fromARGB(0, 0, 0, 0),
              Colors.white,
              Colors.transparent,
              (() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  )),
              337),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff121212)),
        child: Column(children: [
          welcomeImg(),
          Column(
            children: [
              Image.asset('assets/images/logo.png',
                  width: 60, height: 60, fit: BoxFit.fill),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: 300,
                child: const Text(
                  'Millions of Songs. Free on Spotify.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 35),
              buttons(),
            ],
          ),
        ]),
      ),
    );
  }
}
