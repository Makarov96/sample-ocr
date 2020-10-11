import 'package:appbussines/personal_user_info/model/user.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  User user;
  Header({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final nameUser = Container(
      child: (user.name.length > 15) ? AutoSizeText(
        "${user.name}",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ) :AutoSizeText(
        "${user.name}",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );

    final photoUser = InkWell(
        child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
        image: DecorationImage(image: NetworkImage(user.photoURL)
        )
      ),
    ));

    return SafeArea(
      top: true,
      left: true,
      right: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Container(
          margin: EdgeInsets.only(top: screenHeight*0.04),
          width: double.infinity,
          child: Row(children: [nameUser, Spacer(), photoUser]),
        ),
      ),
    );
  }
}
