
import 'package:flutter/material.dart';
import 'Appdrawer.dart';
import 'Homepage.dart';
import 'Middlepage.dart';
import 'launchscreen.dart';
import 'package:flutter/services.dart';
import 'Exitpage.dart';

double height,width;
double deviceRatio;
int wi,he;

void main() {
 /* WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);   */

 runApp(
  MaterialApp(
    routes: <String, WidgetBuilder>{  
      "/":(context)=>LaunchScreen(),
      "/Homepage":(context)=>Homepage(),
      "/MiddlePage":(context)=>MiddlePage(),
      "/Exitpage":(context)=>Exitpage(),
      
    },
    onGenerateRoute: (RouteSettings settings){
      switch(settings.name){
        case '/':
          return MaterialPageRoute(builder:(context)=>LaunchScreen());
          break;
        case '/Homepage':
          return MaterialPageRoute(builder:(context)=>Homepage());
          break;
        case '/MiddlePage':
          return MaterialPageRoute(builder:(context)=>MiddlePage());
          break;
        case '/Exitpage':
          return MaterialPageRoute(builder:(context)=>Exitpage());
          break;
        default: return MaterialPageRoute(builder: (context)=>Exitpage());
      }
    },
  )
);
}