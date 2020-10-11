import 'package:appbussines/Widgets/floatingactionbuttomscustom.dart';
import 'package:appbussines/personal_user_info/bloc/userbloc/userbloc.dart';
import 'package:appbussines/personal_user_info/ui/screens/profile_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHome extends StatelessWidget {
  UserHome({Key key}) : super(key: key);
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButtomCustom(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                userBloc.signOut();
                userBloc.signOutFacebook();
              },
            ),
          ],
        ),
        body: ProfileUser()
        );
  }

}


