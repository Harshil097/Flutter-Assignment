import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide ChangeNotifierProvider;
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import 'Local DB Assignment/2_Provider_pkg.dart';
import 'Local DB Assignment/3_Notes_App.dart';
import 'Task_10.dart';
import 'Task_11.dart';
import 'Task_12.dart';
import 'Task_13.dart';
import 'Task_14.dart';
import 'Task_15.dart';
import 'Task_16.dart';
import 'Task_17.dart';
import 'Task_18.dart';
import 'Task_19.dart';
import 'Task_2.dart';
import 'Task_20.dart';
import 'Task_21_Screen_1.dart';
import 'Task_22_Details_screen.dart';
import 'Task_22_Home_screen.dart';
import 'Task_22_Settings_screen.dart';
import 'Task_23.dart';
import 'Task_24.dart';
import 'Task_25.dart';
import 'Task_26.dart';
import 'Task_27.dart';
import 'Task_28.dart';
import 'Task_29.dart';
import 'Task_30.dart';
import 'Task_31.dart';
import 'Task_32.dart';
import 'Task_33.dart';
import 'Task_34.dart';
import 'Task_35.dart';
import 'Task_36_First_screen.dart';
import 'Task_5.dart';
import 'Task_6.dart';
import 'Task_7.dart';
import 'Task_8.dart';
import 'Task_9.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),

      home: NotesScreen(),

      initialRoute: '/',

      routes: {
        '/details': (context) => DetailsScreen(),
        // '/settings': (context) => SettingsScreen(),
      },
    );
  }
}