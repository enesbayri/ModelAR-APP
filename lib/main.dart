import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modelar/database/db.dart';
import 'package:modelar/router/locator.dart';
import 'package:modelar/router/page_router.dart';
import 'package:modelar/views/menupage/menu_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  getitSetup();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  locator<LocalDB>().db = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: PageRouter.onGenerateRoute,
      theme: ThemeData.dark(),
      home: const MenuPage(),
    );
  }
}



