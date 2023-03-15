import 'package:flutter/material.dart';
import 'package:musapp/pages/authenticate/welcomeScreen.dart';
import 'package:musapp/pages/home/root_app.dart';
import './services/auth.dart';

class widget_tree extends StatefulWidget {
  const widget_tree({Key? key}) : super(key: key);
  @override
  State<widget_tree> createState() => _widget_treeState();
}

class _widget_treeState extends State<widget_tree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const RootApp();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}
