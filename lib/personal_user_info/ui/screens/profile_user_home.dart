import 'package:appbussines/personal_user_info/bloc/userbloc/userbloc.dart';
import 'package:appbussines/personal_user_info/model/user.dart';
import 'package:appbussines/personal_user_info/ui/widgets/headerprofileuserhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:appbussines/personal_user_info/bloc/pagetwobloc/pagetwobloc.dart';

class ProfileUserHome extends StatefulWidget {
  @override
  _ProfileUserHomeState createState() => _ProfileUserHomeState();
}

class _ProfileUserHomeState extends State<ProfileUserHome> {

 // PageTwoBloc pageTwoBloc;
  UserBloc userBloc;


 
  @override
  Widget build(BuildContext context) {
      //  pageTwoBloc = BlocProvider.of<PageTwoBloc>(context);
        userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: StreamBuilder(
        stream: userBloc.auhtStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: SpinKitSquareCircle(color: Colors.white),
              );
              break;

            case ConnectionState.waiting:
              return Center(
                child: SpinKitSquareCircle(color: Colors.white),
              );
              break;

            case ConnectionState.active:
              return profileuserinfo(snapshot);
              break;

            case ConnectionState.done:
              return profileuserinfo(snapshot);
              break;
            default:
          }
        },
      ),
    );
  }

  Widget profileuserinfo(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Center(child: Text("Usuario no logeado. Haz login"));
    } else {
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl,
      );
      return ListView(children: <Widget>[HeaderProfileUserHome(user: user)]);
    }
  }

  
  @override
  void dispose() {
    super.dispose();
    userBloc.close();
  }
}
