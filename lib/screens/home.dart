import 'package:firebase_practice/authenticate/authenticate.dart';
import 'package:firebase_practice/services/auth.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {


  final _auth=new AuthService();
  String email='';
  String password='';

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Brew Crew'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        actions: [
          FlatButton.icon(
            onPressed: () async
          {
            await _auth.signOut();
          }, icon: Icon(
            Icons.person,
          ), label: Text('LogOut'),
          ),
        ],
        elevation: 0.0,

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                   email= val; ;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                 password = val;
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}