import 'package:flutter/material.dart';
import 'package:flutter_task/provider/app_controller.dart';
import 'package:flutter_task/screen/login_screen.dart';
import 'package:provider/provider.dart';

import 'helper/page_routes.dart';
import 'helper/size_config.dart';
import 'helper/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppController()),
       //   ChangeNotifierProvider(create: (context) => ApiController()),
        ],
        child: MaterialApp(
          title: 'flutter task',
          debugShowCheckedModeBanner: false,
          theme: ThemeHelper.lightTheme(),
          navigatorKey: SizeConfig.navigatorKey,
          onGenerateRoute: PageRoutes.onGenerateRoute,
          initialRoute:getPage(),
        ));
  }

  String getPage() {
   // if (SessionManager.isLoggedIn() == false) {
      return LoginScreen.id;
   // }
   // return HomeScreen.id;
  }
}
