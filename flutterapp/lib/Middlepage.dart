import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Homepage.dart';

class MiddlePage extends StatefulWidget {
  
  @override
  _MiddlePageState createState() => _MiddlePageState();
}

  String servervalue ;
  String portvalue ;
  String dropdownValue = '1920x1080';
  int ww = 1920,hh = 1280;

class _MiddlePageState extends State<MiddlePage> {

  final _scontroller = TextEditingController(text: servervalue);
  final _pcontroller = TextEditingController(text: portvalue);


  

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]); */
    return 
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'PlacidVision',
              style: TextStyle(            
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0.0,
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Text("Welcome users !",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Ready to go live ?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Enter the details below :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0,20.0,60.0,20.0),
                      child:Text('Server',style: TextStyle(fontSize: 20, ),),
                    ),
                    Container(
                      width: 220,
                      height: 50,
                      child: TextFormField(
                        
                        controller: _scontroller,
                        decoration: const InputDecoration(
                          hintText: 'Server value',
                        ),
                        /* validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        }, */
                        onSaved: (String value) {
                            servervalue = value;
                          }
                      ),
                    ),
                    
                    
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0,20.0,80.0,20.0),
                      child:Text('Port',style: TextStyle(fontSize: 20, ),),
                    ),
                    Container(
                      width: 220,
                      height: 50,
                      child: TextFormField(
                        
                        controller: _pcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Port value',
                        ),
                        /* validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        }, */
                        onSaved: (String value) {
                            portvalue = value;
                          }
                      ),
                    ),
                    
                    
                  ],
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child:Text('Resolution',style: TextStyle(fontSize: 20, ),),
                    ),
                    DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              print("DDDDD"+dropdownValue);
                              if(dropdownValue=='1920x1080'){
                                ww = 1920;
                                hh = 1080;
                              }
                              else if(dropdownValue=='1280x720'){
                                ww = 1280;
                                hh = 720;
                              }
                              else if(dropdownValue=='720x576'){
                                ww = 720;
                                hh = 576;
                              }
                              print("WIDTH is "+ww.toString());
                            });
                          },
                          items: <String>['1920x1080','1280x720', '720x576']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                  ],
                ),
                SizedBox(height: 15,),
                Text("Note: If you don't fill the details here ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("You cannot stream live from the next screen then !",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Container(
                    padding: EdgeInsets.all(10),
                    height: 75,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: FlatButton(
                        onPressed  :  ()  {
                          /*...*/
                          servervalue = _scontroller.text.toString();
                          print(servervalue);
                          portvalue = _pcontroller.text.toString();

                          Navigator.pushNamed(context, "/Homepage");
                          //audioSvalue = _acontroller.text.toString();
                          /* print(controller.status.value.audiobitrate);
                          
                          
                          print(controller.status.value.audiobitrate); */
                          
                          
                        },
                        child: Text("Go LIVE !",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                      
                      ),
                    )
                )

            ],
          ),
        );
  }
}