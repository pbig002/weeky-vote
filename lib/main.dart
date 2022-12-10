import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/AuthController.dart';
import 'package:weeky_vote/Controller/PositionController.dart';
import 'package:weeky_vote/Presentation/Screen/LogInScreen.dart';
import 'package:weeky_vote/Presentation/Screen/PreviewScreen.dart';
import 'package:weeky_vote/Presentation/Screen/RegisterScreen.dart';
import './Presentation/Screen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider.value(value: PositionController())
      ],
      child: Consumer<AuthController>(
        builder: (context, authData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.amber,
                textTheme: TextTheme(
                    bodyText1: TextStyle(fontSize: 18, fontFamily: "defago notosans", color: Colors.black),
                    bodyText2: TextStyle(fontSize: 18, fontFamily: "defago notosans", color: Colors.white))),
            initialRoute: '/',
            routes: {
              '/': (context) {
                if(authData.isAuth){
                  return  HomeScreen();
                }else{
                  return LogInScreen();
                }
              },
              RegisterScreen.routeName: (context) => RegisterScreen(),
              PreviewScreen.routeName : (context) => PreviewScreen(name: "kileang")
            },
          );
        }
      ),
    );
  }
}
