import 'package:appbussines/Utils/conf.dart';
import 'package:appbussines/personal_user_info/ui/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AddScreenBody extends StatelessWidget {
  final String data;
  AddScreenBody({Key key, this.data}) : super(key: key);
  CameraBloc cameraBloc;
  @override
  Widget build(BuildContext context) {
    cameraBloc = BlocProvider.of<CameraBloc>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: cameraBloc.getAllImage(data),
        builder: (BuildContext context, AsyncSnapshot<IdModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Center(child: CircularProgressIndicator()),
              );
              break;
            case ConnectionState.none:
              return Center(
                child: Center(child: CircularProgressIndicator()),
              );
              break;

            case ConnectionState.done:
            
              if (!snapshot.hasData) {
                return Center(child: Text("No hay data"));
              } else if( snapshot.data.object.length == 0){
                return Center(child: Text("no hay imagenes \n que mostrar por favor \n agrega una para \n scanear"));
              }else{
                return grid(screenHeight, snapshot.data.object);
              }

              break;

            case ConnectionState.active:
                if (!snapshot.hasData) {
                return Center(child: Text("No hay data"));
              } else if( snapshot.data.object.length == 0){
                return Center(child: Text("no hay imagenes \n que mostrar por favor \n agrega una para \n scanear"));
              }else{
                return grid(screenHeight, snapshot.data.object);
              }
              break;
            default:
          }
        });
  }

  Widget grid(screenHeight, List<Object> listID) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.05),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: listID.length,
        itemBuilder: (BuildContext context, int i) {
          final id = listID[i];
          return CustomCard(path: "${Conf.urlNgrok}/documentos/imagen/${id.id}", id: id.id, hash: id.blur,);
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
      ),
    );
  }
}
