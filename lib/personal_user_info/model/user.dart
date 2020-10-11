import 'package:flutter/cupertino.dart';


class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;



  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,

  });
  
}