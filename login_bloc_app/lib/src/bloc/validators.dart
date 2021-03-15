import 'dart:async';

class Validators{

  final validaEmail=StreamTransformer<String,String>.fromHandlers(
    handleData:(email,sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Email invalido');
      }
    }
  );


    final validaPaswword=StreamTransformer<String,String>.fromHandlers(
    handleData:(passwword,sink){
      if(passwword.length>5){
        sink.add(passwword);
      }else{
        sink.addError('Contraseña invalida');
      }
    }
  );
}