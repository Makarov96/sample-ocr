import 'package:flutter/material.dart';

// este es un widget generico
class ButtonGreen extends StatefulWidget {

  double width = 0.0;
  double height =0.0;
  //puedo recivir una funcion como parametro por eso es tan especial
  final VoidCallback onPressed;

// con la key lleva un nombre clave 
// como buenas practicas siempe van las variables que son requeridas
  ButtonGreen({Key key,@required this.onPressed, this.height, this.width});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonGreen();
  }
  
}


class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      // usando widget. podemos acceder a las variables que definimos arriba
      splashColor: Colors.white,
      onTap: widget.onPressed,
      child: Container(
         margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
          // tamaño del boton 
        height: widget.height,
        width: widget.width,
        //decoracion del boton 
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              colors: [
                Color(0xFF1e3c72),//arriba
                Color(0xFF2a5298),//aba#302b63jo
             
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
        

            )
        ),
        //Texto del boton

         child: Center(
          child: Container(
              width: 30,
              height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/google.png")
              )
            )
          )
        ),
      ),
    );
  }
  
}