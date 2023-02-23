import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/auth.dart';

class home_pg extends StatelessWidget {
  final User? user = auth().currentUser;

  Future<void> signOut() async {
    await auth().signout();
  }

  Widget title() {
    return const Text('Homepage');
  }

  Widget userId() {
    return Text(user?.email ?? 'user email');
  }

  Widget signOutButton() {
    return ElevatedButton(
      onPressed: () async {
        await signOut();
      },
      child: const Text('xsxs'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[userId(), signOutButton()],
      )),
    ));
  }
}
