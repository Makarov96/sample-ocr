import 'package:appbussines/personal_user_info/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'cloud_firestore_api.dart';

/*

En este archivo van las llamas de nuestros metodos
 */

class CloudFireStoreRepository {
  //instanciamos la clase que se acaba de hacer 
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  //firma debe de ser identica y no agregamos async
  //estamos trayendo el udapte  update userdata
  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
  
//luego de esto nos vamos al bloc todo comienza asi:
/*
  1.cloud_firestore_api.dart
  2.cloud_firestore_repository.dart
  3.bloc.dart

 */

}