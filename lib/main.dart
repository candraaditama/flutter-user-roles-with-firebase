import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:user_roles/ui/admin_home.dart';
import 'package:user_roles/ui/home.dart';
//import 'package:user_roles/ui/login.dart';
import 'package:user_roles/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:user_roles/utils/auth_helper.dart';
import 'package:user_roles/admin/fitness_app_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data);
            return StreamBuilder(
              stream : FirebaseFirestore.instance.collection("users").doc(snapshot.data.uid).snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData && snapshot.data != null){
                  final user = snapshot.data.data();
                  if(user['role'] =='admin'){
                    return FitnessAppHomeScreen();
                  }else{
                    return HomePage();
                  }
                }
                return Material(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
            //return HomePage();
          }
          return LoginPageUI();
        }
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
