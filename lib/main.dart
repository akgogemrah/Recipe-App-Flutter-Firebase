import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_work/Model/UserModel.dart';
import 'package:recipe_app_work/Pages/MenuPage.dart';
import 'package:recipe_app_work/Pages/SignInPage.dart';
import 'package:recipe_app_work/Services/AuthService.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserModel()),
    Provider(create: (context)=>Auth(create: (BuildContext context) {  },)),
  ],
  child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignPage(),
    );
  }
}


