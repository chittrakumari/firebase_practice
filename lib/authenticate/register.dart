import 'package:firebase_practice/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_practice/shared/constants.dart';
class Register extends StatefulWidget {

  final Function toggleView;
  Register({ required this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
    final _formKey=GlobalKey<FormState>();
  // text field state
  String email = '';
  String password = '';
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('SignIn'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration:textDecoration,
                validator: (val)=>val!.isEmpty?'Enter an email':null,
                onChanged: (val) {
                  setState(() {
                    email=val.trim();
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:textDecoration.copyWith(hintText:'Enter password'),
                validator: (val)=>val!.length<6?'Enter the password 6 characters long':null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password=val.trim();
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password)  ;
                      if(result == null) {
                        setState(() {
                          error = 'Could not register with those credentials';
                        });
                      }
                    }
                  }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
