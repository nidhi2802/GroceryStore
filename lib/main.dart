import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Welcome/welcome_screen.dart';
import 'package:grocery_store/constants.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Grocery Store',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}