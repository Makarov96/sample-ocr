import 'package:flutter/material.dart';

class HeaderScreenImageDetail extends StatelessWidget {
  final String path;
  HeaderScreenImageDetail({Key key, @required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Hero(
      tag: path,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.4,
        decoration: BoxDecoration(
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(path))),
      ),
    );
  }
}