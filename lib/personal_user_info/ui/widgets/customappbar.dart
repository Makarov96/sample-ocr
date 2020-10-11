import 'package:appbussines/Utils/conf.dart';
import 'package:appbussines/personal_user_info/storageusercases/storagedata.dart';
import 'package:appbussines/personal_user_info/ui/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DataSearch extends SearchDelegate<String> {
  CameraBloc cameraBloc;
  String uiUser;
  StorageData storageData = StorageData();

  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      backgroundColor: Colors.black,
      primaryColor: Colors.grey,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.dark,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isNotEmpty) {
              query = "";
            }
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    this.uiUser=storageData.getInfo();
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    cameraBloc = BlocProvider.of<CameraBloc>(context);
    final suggestionList = query;

    return FutureBuilder(
      future: 
      cameraBloc.findOneImage(suggestionList, this.uiUser),
      builder: (BuildContext context, AsyncSnapshot<IdModel> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator());
            break;

          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;

          case ConnectionState.active:
            if (snapshot.data == null) {
              return Center(child: Container());
            } else if (snapshot.data.object.length == 0) {
              return Center(
                child: Text(
                  "No se encontro",
                  style: TextStyle(fontSize: 16),
                ),
              );
            } else {
              return grid(snapshot.data.object);
            }
            break;

          case ConnectionState.done:
            if (snapshot.data == null) {
              return Center(
                child: Text(
                  "No se encontro",
                  style: TextStyle(fontSize: 16),
                ),
              );
            } else if (snapshot.data.object.length == 0) {
              return Center(
                child: Text(
                  "No se encontro",
                  style: TextStyle(fontSize: 16),
                ),
              );
            } else {
              return grid(snapshot.data.object);
            }
            break;
          default:
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? Container() : Container();
    return suggestionList;
  }
}

Widget grid(List<Object> listID) {
  return Center(
    child: StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: listID.length,
      itemBuilder: (BuildContext context, int i) {
        final id = listID[i];
        return CustomCardGreen(
            path: "${Conf.urlNgrok}/documentos/imagen/${id.id}", id: id.id, hash: id.blur);
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 2),
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
    ),
  );
}
