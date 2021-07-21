import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/authenticate/authenticate.dart';
import 'package:firebase_practice/models/brew.dart';
import 'package:firebase_practice/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_practice/services/DatabaseService.dart';
import 'package:provider/provider.dart';
import 'package:firebase_practice/screens/brew_list.dart';

class home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
