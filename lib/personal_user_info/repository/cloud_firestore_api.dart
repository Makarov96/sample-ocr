//aca  ira la logica de subir una identidad a firestore
import 'package:appbussines/personal_user_info/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


//si las ponemos en mayusculas significa que son constantes
class CloudFirestoreAPI {
  //la parte mas alta debe de ir en plural
  final String USERS = "users";

  //aca copiaremos  la variable que nos trae toda la informacion del usuari oque actualmente logeado
  //muuuuy importante
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Definir nuestra entidad base de datos
  /*Entidad base de datos
  obtendra la conexion y la entidad usuario 
  */
  final Firestore _db = Firestore.instance;

  //va recibir un objeto de tipo usuario porque eso va ingresar
  void updateUserData(User user) async {
    //definit nuestra data
    //le pasamo el id para que la collection sea unica
    DocumentReference ref = _db.collection(USERS).document(user.uid);

    //aca lo que haremos sera devolver los fields practicamente
    //seria como devolver el json
    //await para que se ejecute en segundo plano
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'lastSignIn': DateTime.now()
    }, merge: true);
    //merge es para que se aplique a la base de datos
  }




}
