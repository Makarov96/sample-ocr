import 'package:flutter/material.dart';

class FloatingActionButtomCustom extends StatelessWidget {
    final VoidCallback onPressed;
    final Icon icon;

   FloatingActionButtomCustom({Key key, @required this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      child: this.icon,
      onPressed: onPressed);
  }
}