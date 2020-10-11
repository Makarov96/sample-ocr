import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookLoginApi {
  bool isLoggenIn = false;


  void initiateFacebooLogin() async{
    var login = FacebookLogin();
    var result = await  login.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Surgio un error");
        break;

      case FacebookLoginStatus.cancelledByUser:
        print("Cancelado por el usuario");
        break;
      case FacebookLoginStatus.loggedIn:
          onLoginStatusChange(true);
        break;

      default:
    }

  }


  void onLoginStatusChange(bool isLogged){
    this.isLoggenIn = isLoggenIn;
  }


}