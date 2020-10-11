import 'dart:io';
import 'package:appbussines/personal_user_info/model/ids.dart';
import 'package:appbussines/personal_user_info/model/informationimage.dart';
import 'package:appbussines/personal_user_info/repository/provider_conf_camera.dart';
import 'package:http/http.dart';

class ProviderCameraRepository {

  ProviderConfCamera _providerConfCamera = ProviderConfCamera();

   Future<File>takePhoto(String idUser) => _providerConfCamera.takePhoto(idUser);

   Future<File> getImage() => _providerConfCamera.getImage();

   Future<StreamedResponse> sendImage(File image, idUser) => _providerConfCamera.sendImage(image, idUser);

   Future<IdModel> getAllImage(String idUser) => _providerConfCamera.getAllImage(idUser);

   Future<IdModel> findOneImage(String data, String idUser) => _providerConfCamera.findOneImage(data, idUser);
   
   Future<Informationimage> getInformationImage(String id) => _providerConfCamera.getInformationImage(id);

}