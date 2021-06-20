import 'package:firebase_practice/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_practice/screens/home.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authenticate();
  }
}
