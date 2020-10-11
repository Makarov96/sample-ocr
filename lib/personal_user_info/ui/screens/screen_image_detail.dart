import 'package:appbussines/personal_user_info/ui/widgets/exports.dart';
import 'package:flutter/material.dart';


class ScreenImageDetail extends StatelessWidget {
  final String path, id;
  ScreenImageDetail({Key key, this.path, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:   Column(children: <Widget>[
            
            Expanded(child: ListView(
              children:<Widget>[
                HeaderScreenImageDetail(
              path: path,
            ),
                BodyScreenImageDetail(id: id)
              ]
            ))
          ]));
  }
}



