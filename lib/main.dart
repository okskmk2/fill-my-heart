import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/pages/login_page.dart';
import 'package:thank_tree/pages/start_page.dart';
import 'package:thank_tree/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Color(0xff0ACC86),
            fontFamily: 'SpoqaHanSansNeo',
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontWeight: FontWeight.bold)),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff0ACC86),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 56)))),
            appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.white,
                iconTheme: IconThemeData(color: Colors.black))),
        debugShowCheckedModeBanner: false,
        home: user == null ? StartPage() : MainScreen());
  }
}
