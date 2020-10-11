import 'package:appbussines/personal_user_info/model/informationimage.dart';
import 'package:appbussines/personal_user_info/ui/widgets/exports.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyScreenImageDetail extends StatelessWidget {
  final String id;
  CameraBloc cameraBloc;
  BodyScreenImageDetail({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cameraBloc = BlocProvider.of<CameraBloc>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: cameraBloc.getInformationImage(id),
      builder:
          (BuildContext context, AsyncSnapshot<Informationimage> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator());
            break;

          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;

          case ConnectionState.done:
            return showDataImage(snapshot.data, screenHeight, screenWidth);
            break;

          case ConnectionState.active:
            return showDataImage(snapshot.data, screenHeight, screenWidth);
            break;

          default:
        }
      },
    );
  }

  Widget showDataImage(Informationimage data, screenHeight, screenWidth) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.05),
      width: screenWidth * 0.8,
      height: screenHeight * 1,
      child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.05),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Expanded(
              flex: 2,
              child: ListView(children: [
                AutoSizeText(
                  "${data.ocr}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                )
              ]))),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}
