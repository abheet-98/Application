import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'Homepage.dart';
import 'Appdrawer.dart';
import 'Middlepage.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}
class _LaunchScreenState extends State<LaunchScreen> {

   @override
   void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }

  Widget build(BuildContext context) {

    width = (MediaQuery.of(context).size.width);
    height = (MediaQuery.of(context).size.height);
    
    deviceRatio = (height / width);
    
    
    //deviceRatio = (width / height);
    print("WWWW"+width.toString());
    print("HHHHH"+height.toString());

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
          //Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, "/MiddlePage");
      });
    });
          return Scaffold(
            backgroundColor: Colors.white,

            body: Align(
              alignment: Alignment.center,
              child: Container(
                  child:SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 16.0),
                          Align(
                            child:Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                  "App",
                                  style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Roboto",color: Colors.grey, fontSize: 45),
                                  ),
                                ),
                                Text(
                                'Name',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.w300,fontFamily: "Roboto",color: Colors.pink[400], fontSize: 45),
                                ),                                
                              ]
                            )
                          ),
                        ],
                      ),
                    ),  
                ),
               ),
            );

  }


}