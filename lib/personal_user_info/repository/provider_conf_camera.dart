import 'dart:convert';
import 'dart:io';
import 'package:appbussines/Utils/conf.dart';
import 'package:appbussines/personal_user_info/model/ids.dart';
import 'package:appbussines/personal_user_info/model/informationimage.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProviderConfCamera {
  Future<IdModel> getAllImage(String idUser) async {
    final response = await http.get("${Conf.urlNgrok}/documentos/${idUser}");
    return idModelFromJson(response.body);
  }

  Future<Informationimage> getInformationImage(String id) async {
    final response = await http.get("${Conf.urlNgrok}/documentos/ocr/${id}");
    return informationimageFromJson(response.body);
  }

  ///documentos/buscar/:user/:busqueda
  Future<IdModel> findOneImage(String data, String idUser) async {
    final response =
        await http.get("${Conf.urlNgrok}/documentos/buscar/${idUser}/${data}");
    return idModelFromJson(response.body);
  }

  Future<File> getImage() async {
    File _image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    return _image;
  }

  Future<File> takePhoto(String idUser) async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
        _cropImage(image, idUser);
    return image;
  }

  Future<Null> _cropImage(File image, String idUser) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      image = croppedImage;
    }

    sendImage( image, idUser);
  }

  Future<StreamedResponse> sendImage(File image, idUser) async {
    var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    var uri = Uri.parse("${Conf.urlNgrok}/mongo/imageupload/${idUser}");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('doc', stream, length,
        filename: basename(image.path),
        contentType:
            MediaType('application', "json", {"Content-type": "image/jpeg"}));
    request.files.add(multipartFile);
    var response = await request.send();
    return response;
  }
  
}
