import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/pages/main_page.dart';
import 'package:instagram_clone/providers/Profile/user_data.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Why WidgetsFlutterBidning is used
  /// https://stackoverflow.com/questions/63873338/what-does-widgetsflutterbinding-ensureinitialized-do
  /// Essentially Flutter is having to call native code so this allows it to interact with the engine.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appSecondaryColour),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}