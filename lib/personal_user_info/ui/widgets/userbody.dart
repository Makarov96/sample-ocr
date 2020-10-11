import 'package:appbussines/Widgets/Transitions/fade_route.dart';
import 'package:appbussines/Widgets/customshowdialog.dart';
import 'package:appbussines/personal_user_info/ui/screens/screenaddphoto.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class UserBody extends StatelessWidget {
  UserBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final single_card = InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white24,
        onTap: () {
          Navigator.push(context, FadeRoute(page: ScreenAddPhoto()));
        },
        child: Container(
          alignment: Alignment.center,
          height: screenHeight * 0.3,
          width: screenWidth * 1,
          child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/document.png")))),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.20), BlendMode.dstATop),
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/cover.jpg")),
              borderRadius: BorderRadius.circular(10)),
        ));

    final single_card_two = InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white24,
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => FlareGiffyDialog(
                    flarePath: 'assets/images/Meteor.flr',
                    onlyOkButton: true,
                    flareAnimation: 'Idle',
                    title: Text(
                      'Vuelvete Pro',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      'Para poder usar esta funcion debes de actualizarte a una version pro, asi apoyas al equipo a agregar mas funciones.',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    onOkButtonPressed: () {
                      Navigator.pop(context);
                    },
                  ));
        },
        child: Stack(children: <Widget>[
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/premiun.png")))),
          ),
          Container(
            alignment: Alignment.center,
            height: screenHeight * 0.4,
            width: screenWidth * 0.4,
            child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/word.png")))),
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.dstATop),
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/computer.jpeg")),
                borderRadius: BorderRadius.circular(10)),
          ),
        ]));

    final single_card_three = InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white24,
        onTap: () {
           showDialog(
              context: context,
              builder: (BuildContext context) => FlareGiffyDialog(
                  onlyOkButton: true,
                    flarePath: 'assets/images/Meteor.flr',
                    flareAnimation: 'Idle',
                    title: Text(
                      'Vuelvete Pro',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      'Para poder usar esta funcion debes de actualizarte a una version pro, asi apoyas al equipo a agregar mas funciones.',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    onOkButtonPressed: () {
                      Navigator.pop(context);
                    },
                  ));
        },
        child: Stack(children: <Widget>[
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/premiun.png")))),
          ),
          Container(
            alignment: Alignment.center,
            height: screenHeight * 0.26,
            width: screenWidth * 0.4,
            child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/image.png")))),
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.dstATop),
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/upload.jpg")),
                borderRadius: BorderRadius.circular(10)),
          ),
        ]));

    final single_card_four = InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white24,
        onTap: () {
           showDialog(
              context: context,
              builder: (BuildContext context) => FlareGiffyDialog(
                  onlyOkButton: true,
                    flarePath: 'assets/images/Meteor.flr',
                    flareAnimation: 'Idle',
                    title: Text(
                      'Vuelvete Pro',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      'Para poder usar esta funcion debes de actualizarte a una version pro, asi apoyas al equipo a agregar mas funciones.',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    onOkButtonPressed: () {
                      Navigator.pop(context);
                    },
                  ));
        },
        child: Stack(children: <Widget>[
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/premiun.png")))),
          ),
          Container(
            alignment: Alignment.center,
            height: screenHeight * 0.26,
            width: screenWidth * 0.4,
            child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/pdf.png")))),
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.20), BlendMode.dstATop),
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/books.jpg")),
                borderRadius: BorderRadius.circular(10)),
          ),
        ]));

    final separator = Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: AutoSizeText(
          "Otros",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );

    final custom_grid = Container(
      child: Wrap(children: <Widget>[
        single_card_two,
        Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 35.0), child: single_card_three),
          Padding(
              padding: EdgeInsets.only(left: 35.0, top: 15),
              child: single_card_four),
        ])
      ]),
    );

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.125),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            single_card,
            separator,
            custom_grid,
          ],
        ),
      ),
    );
  }
}
