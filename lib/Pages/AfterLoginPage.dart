import 'package:flutter/material.dart';


// Bu sayfa geçiçi bir sayfadır, kullanıcı girişlerinin kontrol edildiği sayfadır.

class AfterLogin extends StatelessWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Başarılı bir şekilde giriş yapılmıştır")),
    );
  }
}
