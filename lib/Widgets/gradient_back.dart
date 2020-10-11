import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";
  double height = 0.0;

  GradientBack({Key key, this.height}); // height = null full screen

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //con este metodo nos obtiene el tamaño de cualquier celular
    //segun ella es bien vergas este metodo
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWitdht = MediaQuery.of(context).size.width;
    //si es null el dato ingresado se obtendra la medida completa de la pantalla
    if (height == null) {
      height = screenHeight;
    }

    return Container(
        width: screenWitdht,
        height: height,
        decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/template.gif")),
         ));
  }
}
