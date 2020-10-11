import 'dart:async';
import 'dart:io';
import 'package:appbussines/personal_user_info/model/ids.dart';
import 'package:appbussines/personal_user_info/model/informationimage.dart';
import 'package:appbussines/personal_user_info/repository/managmentstorage.dart';
import 'package:appbussines/personal_user_info/repository/provider_camera_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc {
  @override
  CameraState get initialState => CameraInitial();
  ManagmentStorage managmentStorage = ManagmentStorage();

  ProviderCameraRepository _providerCameraRepository =
      ProviderCameraRepository();


  Future<IdModel> getAllImage(String idUser) =>
      _providerCameraRepository.getAllImage(idUser);



  Future<IdModel> findOneImage(String data, String idUser) =>
      _providerCameraRepository.findOneImage(data, idUser);


  Future<Informationimage> getInformationImage(String id) => _providerCameraRepository.getInformationImage(id);


  BehaviorSubject<String> idUser = BehaviorSubject<String>();
  Stream<String> get idUserOut => idUser.stream;
  Sink<String> get idUserIn => idUser.sink;

  BehaviorSubject<String> allPhotoId = BehaviorSubject<String>();
  Stream<String> get allPhotoIdOut => allPhotoId.stream;
  Sink<String> get allPhotoIdIn => allPhotoId.sink;

  BehaviorSubject<File> photo = BehaviorSubject<File>();
  Stream<File> get sendOutFoto => photo.stream;
  Sink<File> get sendInPhoto => photo.sink;

  BehaviorSubject<File> cameraPhoto = BehaviorSubject<File>();
  Stream<File> get outFoto => cameraPhoto.stream;
  Sink<File> get inFoto => cameraPhoto.sink;

  takeaPhoto(userID) {
    _providerCameraRepository
        .takePhoto(userID)
        .catchError((e) {});
  }

  getImage(userID) {
    _providerCameraRepository
        .getImage()
        .then((image) => {
              _providerCameraRepository.sendImage(image, userID)
            })
        .catchError((e) {});
  }



  alldata() {
    managmentStorage.readDocumentUserID().then((value) => idUserIn.add(value));
  }

  @override
  void dispose() {
    allPhotoId.close();
    idUser.close();
    photo.close();
    cameraPhoto.close();
  }

  @override
  Stream mapEventToState(event) {

    throw UnimplementedError();
  }


}
