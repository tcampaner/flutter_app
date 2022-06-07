import 'package:flutter/material.dart';
import 'package:practica_final_2/providers/baleart_provider.dart';
import 'package:practica_final_2/providers/login_provider.dart';
import 'package:practica_final_2/screens/screens.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';
import 'shared_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EspaisProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => LoginProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baleart',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginScreen(),
        'home': (BuildContext context) => HomeScreen(),
        'details': (BuildContext context) => DetailsScreen(),
      },
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey)
          .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
    );
  }
}
