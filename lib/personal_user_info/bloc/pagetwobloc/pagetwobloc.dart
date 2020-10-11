import 'dart:async';
import 'dart:ffi';
import 'package:appbussines/personal_user_info/bloc/userbloc/userbloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageTwoBloc extends Bloc {

   UserBloc userBloc;
  StreamController managmentstatuspagetwo;

  StreamSubscription streamSubscription;

  PageTwoBloc(){
    streamSubscription = userBloc.auhtStatus.listen((data) { 
      managmentstatuspagetwo.add(data);
      
    }, onDone: (){
      print("con exito");
    },
    onError: (){
      print('Salio mal :c');
    }
    );
  }



  Future<Void> close(){
    streamSubscription.cancel();
     managmentstatuspagetwo.close();

    return super.close();
  }

  @override

  get initialState => throw UnimplementedError();

  @override
  Stream mapEventToState(event) {

    throw UnimplementedError();
  }
  
}