import 'package:appbussines/personal_user_info/bloc/bloc/camera_bloc.dart';
import 'package:appbussines/personal_user_info/bloc/pagetwobloc/pagetwobloc.dart';
import 'package:appbussines/personal_user_info/bloc/userbloc/userbloc.dart';
import 'package:appbussines/personal_user_info/ui/screens/profile_user_home.dart';
import 'package:appbussines/personal_user_info/ui/screens/userhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NavBarUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavBarUser();
  }
}

class _NavBarUser extends State<NavBarUser> {
  int indexTap = 0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0, keepPage: true);

    void onTapTapped(int index) {
      setState(() {
        indexTap = index;
        controller.animateToPage(index,
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      });
    }

    void pageChanged(int index) {
      setState(() {
        indexTap = index;
      });
    }
//ProfileUserHome()
    final pageView = PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[UserHome(), ], //ProfileUserHome()
    );

    return MultiBlocProvider(
       providers: [
        BlocProvider<UserBloc>(create: ( BuildContext context) => UserBloc()),
        //BlocProvider<PageTwoBloc>(create: (BuildContext context) => PageTwoBloc()),
        BlocProvider<CameraBloc>(create: (BuildContext context) => CameraBloc()),
      ],
      child: Scaffold(
        body: pageView,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.black,
              primaryColor: Color.fromARGB(230, 226, 80, 116)),
          child: BottomNavigationBar(
            onTap: (index) {
              onTapTapped(index);
            },
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("")),
            ],
          ),
        ),
      ),
     
    );
  }
}
