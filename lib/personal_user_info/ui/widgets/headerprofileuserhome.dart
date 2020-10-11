import 'package:appbussines/personal_user_info/model/user.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeaderProfileUserHome extends StatelessWidget {
  User user;
  HeaderProfileUserHome({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final userphoto = Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white, width: 4.0, style: BorderStyle.solid),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(this.user.photoURL))),
    );

    final username = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: screenHeight * 0.025),
        child: AutoSizeText("${user.name}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)));

    return SafeArea(
      top: true,
      left: true,
      right: true,
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight*0.03),
              child: Column(
          children: [userphoto, username],
        ),
      ),
    );
  }
}
