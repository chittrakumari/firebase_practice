import 'package:firebase_practice/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_practice/authenticate/register.dart';
class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
