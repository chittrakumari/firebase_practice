import 'package:firebase_practice/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_practice/models/user.dart';
import 'package:firebase_practice/screens/home.dart';
class wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<CustomUser?>(context);
    print(user);

    //return Home or authenticate widget.
    if(user==null){
    return authenticate();
  }
    else{
      return home();
    }
  }
}
