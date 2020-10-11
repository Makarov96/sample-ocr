import 'package:appbussines/Widgets/Transitions/fade_route.dart';
import 'package:appbussines/personal_user_info/ui/screens/screen_image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class CustomCardGreen extends StatelessWidget {
  final String path, id, hash;

  CustomCardGreen({Key key, this.path,  this.id, this.hash}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final card = Padding(
        padding:  EdgeInsets.only(top:5.0),
        child: InkWell(
          onTap: () {
             Navigator.push(context, FadeRoute(page: ScreenImageDetail(path: path, id:id)));
          },
          splashColor: Colors.white,
          child: Container(
            width: screenWidth * 0.35,
            height: screenHeight * 0.35,
            child: Stack(children: <Widget>[
               BlurHash(
                  hash: hash,
                  image: path,
                ),
              Container(
                  alignment: Alignment.center,
                  width: 90,
                  height: 20,
                  child: Text(
                    "Encontrado",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  decoration: BoxDecoration(color: Color(0xFF1ED760)))
            ]),
          
          ),
          borderRadius: BorderRadius.circular(7),
        ),
    );

    return  card ;
  }
}
