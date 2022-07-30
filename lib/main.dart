import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/pages/home_page.dart';
import 'package:thank_tree/pages/leaf/leaf_form_page.dart';
import 'package:thank_tree/pages/start_page.dart';
import 'package:thank_tree/pages/vase_detail_page.dart';
import 'package:thank_tree/services/auth_service.dart';
import 'package:thank_tree/services/vase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => VaseService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
        routes: {
          '/home': (context) => HomePage(),
          '/leaf-form': (context) => LeafFormPage(),
          '/vase-detail': (context) => VaseDetailPage()
        },
        theme: CustomStyles.customTheme,
        debugShowCheckedModeBanner: false,
        home: user == null ? StartPage() : MainScreen());
  }
}
