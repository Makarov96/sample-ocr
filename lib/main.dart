import 'package:appbussines/personal_user_info/bloc/bloc/camera_bloc.dart';
import 'package:appbussines/personal_user_info/bloc/userbloc/userbloc.dart';
import 'package:appbussines/personal_user_info/repository/managmentstorage.dart';
import 'package:appbussines/personal_user_info/ui/screens/screen_image_detail.dart';
import 'package:appbussines/personal_user_info/ui/screens/screenaddphoto.dart';
import 'package:appbussines/personal_user_info/ui/screens/sign_in_screen.dart';
import 'package:appbussines/personal_user_info/ui/screens/userhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ManagmentStorage managmentStorage = ManagmentStorage();
  @override
  void initState() {
    managmentStorage.createStragoe();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
        // BlocProvider<PageTwoBloc>(create: (BuildContext context) => PageTwoBloc()),
        BlocProvider<CameraBloc>(
            create: (BuildContext context) => CameraBloc()),
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: UserHome(), //ProfileUserHome(), //
        routes: <String, WidgetBuilder>{
          '/adddocument': (BuildContext context) => ScreenAddPhoto(),
          '/screenimagedetail': (BuildContext context) => ScreenImageDetail()
        },
      ),
    );
  }
}
//
