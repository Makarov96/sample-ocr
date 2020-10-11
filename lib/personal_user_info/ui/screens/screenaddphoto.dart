import 'package:appbussines/Widgets/floatingactionbuttomscustom.dart';
import 'package:appbussines/personal_user_info/bloc/bloc/camera_bloc.dart';
import 'package:appbussines/personal_user_info/ui/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddPhoto extends StatefulWidget {
  ScreenAddPhoto({Key key}) : super(key: key);

  @override
  _ScreenAddPhotoState createState() => _ScreenAddPhotoState();
}

class _ScreenAddPhotoState extends State<ScreenAddPhoto> {
  CameraBloc cameraBloc;

  ManagmentStorage managmentStorage = ManagmentStorage();

  @override
  Widget build(BuildContext context) {
    cameraBloc = BlocProvider.of<CameraBloc>(context);

    cameraBloc.alldata();
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca un documento"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButtomCustom(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            managmentStorage
                .readDocumentUserID()
                .then((iduser) => cameraBloc.getImage(iduser));

            //
          },
        ),
        SizedBox(
          height: 16.0,
        ),
        FloatingActionButtomCustom(
          icon: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: () {
            managmentStorage
                .readDocumentUserID()
                .then((iduser) => cameraBloc.takeaPhoto(iduser));
          },
        )
      ]),
      body: StreamBuilder(
        stream: cameraBloc.idUserOut,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: Text("No hay datos cargados"));
          } else {
            return Stack(children: <Widget>[
              AddScreenBody(
                data: snapshot.data,
              ),
            ]);
          }
        },
      ),
    );
  }
}

