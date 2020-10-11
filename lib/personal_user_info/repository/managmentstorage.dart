import 'package:appbussines/Utils/conf.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ManagmentStorage {
  var storage = FlutterSecureStorage();

  void createStragoe() {
    this.storage;
  }

  void writeDocumentUserId(userId) async {
    await storage.write(key: Conf.SECURE_NOTE_KEY, value: userId);
  }

  Future readDocumentUserID() async {
    return await storage.read(key: Conf.SECURE_NOTE_KEY);
  }

  Future deleteAllElements() async {
    return await storage.deleteAll();
  }

  disponseApp() {
    return this.storage = null;
  }
}
