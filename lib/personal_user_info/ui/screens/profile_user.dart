import 'package:appbussines/personal_user_info/bloc/userbloc/userbloc.dart';
import 'package:appbussines/personal_user_info/model/user.dart';
import 'package:appbussines/personal_user_info/ui/widgets/exports.dart';
import 'package:appbussines/personal_user_info/ui/widgets/userbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  UserBloc userBloc;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    userBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
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
            return showPofileData(snapshot);
            break;

          case ConnectionState.done:
            return showPofileData(snapshot);
            break;

          default:
        }
      },
    );
  }

  Widget showPofileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[Text("Usuario no logeado. Haz login")],
          ),
        ],
      );
    } else {
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl,
      );

      return Stack(
        children: <Widget>[
          UserBody(),
          Header(
            user: user,
          )
        ],
      );
    }
  }
}
