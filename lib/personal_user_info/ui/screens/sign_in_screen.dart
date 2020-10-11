import 'package:appbussines/Widgets/button_facebook_login.dart';
import 'package:appbussines/Widgets/button_green.dart';
import 'package:appbussines/Widgets/gradient_back.dart';
import 'package:appbussines/personal_user_info/ui/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;
  double screenWitdht;
  bool isPressed = false;
  ManagmentStorage managmentStorage = ManagmentStorage();


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    screenWitdht = MediaQuery.of(context).size.width;
 

    return _handleCurrentSession();
  }


  Widget _handleCurrentSession() {

    return StreamBuilder(

      stream: userBloc.auhtStatus,

      builder: (BuildContext context, AsyncSnapshot snapshot) {
  

        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return NavBarUser();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            height: null,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWitdht,
                  child: Text("Welcome \n to your scanner app",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 37.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              ButtonGreen(
                  onPressed: () {
                    userBloc.signOut();
                    userBloc.signIn()
                    .then((FirebaseUser user) {
               
                      userBloc.updateUserData(User(
                          uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoUrl));
                          managmentStorage.writeDocumentUserId(user.uid);
                           isPressed = !isPressed;
                    }).catchError((e) {
                        setState(() {
                          isPressed = false;
                        });
                      });
                       setState(() {
                        isPressed = !isPressed;
                      });
                  },
                  width: 300,
                  height: 50.0),

                  ButtonFacebookLogin(
                     width: 300,
                  height: 50.0,
                    onPressed: (){
                     userBloc.signInFacebook().then((FirebaseUser user) {
               
                      userBloc.updateUserData(User(
                          uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoUrl));
                          managmentStorage.writeDocumentUserId(user.uid);
                           isPressed = !isPressed;
                    }).catchError((e) {
                        setState(() {
                          isPressed = false;
                        });
                      });
                       setState(() {
                        isPressed = !isPressed;
                      });
                  },)
            ],
          )
        ],
      ),
    );
  }
}


