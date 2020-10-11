import 'package:appbussines/personal_user_info/repository/managmentstorage.dart';

class StorageData {
  ManagmentStorage managmentStorage = ManagmentStorage();
  String uiUser;
   getInfo(){
     
        managmentStorage.readDocumentUserID().then((value) => {this.uiUser= value});
      return uiUser;
  }
}