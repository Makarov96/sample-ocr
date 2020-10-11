import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class CustomShowDialog extends StatelessWidget {
  final String pathFlare;
  final String initAnimation;
  final String title;
  final String description;
  CustomShowDialog(
      {Key key,
      this.pathFlare,
      this.initAnimation,
      this.title,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      
      },
    );
  }
}
